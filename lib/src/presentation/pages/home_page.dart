import 'dart:async';

import 'package:app/core/utils/task_group_name.dart';
import 'package:app/src/presentation/models/task_board_model.dart';
import 'package:app/src/domain/entities/task_entity.dart';
import 'package:app/src/presentation/cubit/task_cubit.dart';
import 'package:app/src/presentation/cubit/theme_cubit.dart';
import 'package:app/src/presentation/widgets/task_board_shimmer_widget.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppFlowyBoardController _controller;
  late AppFlowyBoardScrollController _boardScrollController;

  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();

  Color getPerformanceColor(int value) {
    if (value >= 10) return Colors.green;
    if (value >= 5) return Colors.yellow;
    return Colors.red;
  }

  @override
  void initState() {
    super.initState();
    _boardScrollController = AppFlowyBoardScrollController();

    _controller = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Move group');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) async {
        final cubit = context.read<TaskCubit>();

        final group = _controller.getGroupController(groupId);
        if (group == null) return;

        if (fromIndex < 0 || fromIndex >= group.items.length) return;

        final item = group.items[fromIndex];
        if (item is! TaskBoardModel) return;

        final taskId = item.task.indicatorToMoId;
        if (taskId == null) return;

        await cubit.updateTaskField(
          indicatorId: taskId,
          fieldName: "order",
          value: toIndex,
        );
      },
      onMoveGroupItemToGroup:
          (fromGroupId, fromIndex, toGroupId, toIndex) async {
            final cubit = context.read<TaskCubit>();

            final task =
                _controller.getGroupController(fromGroupId)?.items[fromIndex]
                    as TaskBoardModel;

            final taskId = task.task.indicatorToMoId!;
            final oldParentId = task.task.parentId;
            final newParentId = int.parse(toGroupId);

            if (oldParentId == newParentId) return;

            await cubit.updateTaskField(
              indicatorId: taskId,
              fieldName: "parent_id",
              value: newParentId,
            );

            await cubit.updateTaskField(
              indicatorId: taskId,
              fieldName: "order",
              value: toIndex,
            );
          },
    );

    context.read<TaskCubit>().loadTasks();
  }

  Future<void> _pickDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(
        start: DateTime(2026, 4, 1),
        end: DateTime(2026, 4, 30),
      ),
    );

    if (!context.mounted) return;

    if (picked != null) {
      context.read<TaskCubit>().setDateRange(picked.start, picked.end);
    }
  }

  void _mapToBoard(Map<int, List<TaskEntity>> columns) {
    _controller.clear();

    for (final entry in columns.entries) {
      final groupId = entry.key;

      final items = entry.value
          .map<AppFlowyGroupItem>((task) => TaskBoardModel(task))
          .toList();

      _controller.addGroup(
        AppFlowyGroupData(
          id: groupId.toString(),
          name: 'Column $groupId',
          items: items,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: (value) {
                  context.read<TaskCubit>().setSearchQuery(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Поиск задачи...',
                  border: InputBorder.none,
                ),
              )
            : const Text("KPI-DRIVE"),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 6),
              child: Text(
                "Управление и Мотивация в 21м веке",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;

                if (!_isSearching) {
                  _searchController.clear();
                  context.read<TaskCubit>().setSearchQuery('');
                }
              });
            },
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () => _pickDateRange(context),
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),

          const SizedBox(width: 20),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (BuildContext context, TaskState state) {
            state.maybeWhen(
              loaded: (columns) {
                _mapToBoard(columns);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              empty: () {
                if (_searchController.text.isNotEmpty) {
                  return Center(
                    child: Text(
                      "По запросу \"${_searchController.text}\" нет задач",
                    ),
                  );
                }
                return const Center(child: Text("Нет задач"));
              },
              orElse: () {
                return const TaskBoardShimmerWidget();
              },
              loaded: (columns) {
                return AppFlowyBoard(
                  controller: _controller,
                  boardScrollController: _boardScrollController,
                  groupConstraints: const BoxConstraints.tightFor(width: 280),
                  headerBuilder: (context, groupData) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        int.tryParse(groupData.id)?.groupName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                  cardBuilder: (context, group, groupItem) {
                    if (groupItem is! TaskBoardModel) {
                      return const SizedBox();
                    }

                    final task = groupItem.task;

                    final percent = task.order ?? 0;

                    final isDark =
                        Theme.of(context).brightness == Brightness.dark;
                    final cardColor = isDark
                        ? const Color(0xFF1A1D24)
                        : Colors.white;

                    return AppFlowyGroupCard(
                      key: ObjectKey(groupItem),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey.shade700,
                              child: Text(
                                (task.name ?? 'A')[0],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.name ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: getPerformanceColor(percent),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '$percent',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
