import 'dart:async';

import 'package:app/core/network/network_result.dart';
import 'package:app/core/utils/date_formatter.dart';
import 'package:app/src/domain/entities/task_entity.dart';
import 'package:app/src/domain/use_cases/get_remote_tasks_use_case.dart';
import 'package:app/src/domain/use_cases/update_remote_task_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_state.dart';

part 'task_cubit.freezed.dart';

@LazySingleton()
class TaskCubit extends Cubit<TaskState> {
  final GetRemoteTasksUseCase _getTasks;
  final UpdateRemoteTaskUseCase _updateRemoteTaskUseCase;

  TaskCubit(this._getTasks, this._updateRemoteTaskUseCase)
    : super(const TaskState.initial());

  DateTime? _startDate;
  DateTime? _endDate;

  String _searchQuery = '';
  List<TaskEntity> _allTasks = [];

  Timer? _updateDebounce;

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase().trim();
    _applyFilters();
  }

  void setDateRange(DateTime start, DateTime end) {
    _startDate = start;
    _endDate = end;
    loadTasks();
  }

  Future<void> loadTasks() async {
    emit(const TaskState.loading());

    final start = _startDate ?? DateTime(2026, 4, 1);
    final end = _endDate ?? DateTime(2026, 4, 30);

    try {
      final resp = await _getTasks(
        params: {
          "period_start": DateFormatter.toYMD(start),
          "period_end": DateFormatter.toYMD(end),
          "period_key": "month",
          "requested_mo_id": "42",
          "behaviour_key": "task,kpi_task",
          "with_result": "false",
          "response_fields": "name,indicator_to_mo_id,parent_id,order",
          "auth_user_id": "40",
        },
      );

      if (resp is Success) {
        _allTasks = resp.data ?? [];

        if (_allTasks.isEmpty) {
          emit(const TaskState.empty());
          return;
        }

        _applyFilters();
      }
    } catch (e) {
      emit(TaskState.error(e.toString()));
    }
  }

  void _applyFilters() {
    final filtered = _allTasks.where((task) {
      final name = (task.name ?? '').toLowerCase();
      return name.contains(_searchQuery);
    }).toList();

    if (filtered.isEmpty) {
      emit(const TaskState.empty());
      return;
    }

    final grouped = _mapTasks(filtered);
    emit(TaskState.loaded(grouped));
  }

  Map<int, List<TaskEntity>> _mapTasks(List<TaskEntity> tasks) {
    final Map<int, List<TaskEntity>> grouped = {};

    for (final task in tasks) {
      grouped.putIfAbsent(task.parentId ?? 0, () => []);
      grouped[task.parentId]!.add(task);
    }

    // сортировка внутри каждой группы
    for (final list in grouped.values) {
      list.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
    }

    return grouped;
  }

  Future<void> updateTaskField({
    required int indicatorId,
    required String fieldName,
    required dynamic value,
  }) async {
    _updateDebounce?.cancel();

    _updateDebounce = Timer(const Duration(seconds: 1), () async {
      try {
        await _updateRemoteTaskUseCase(
          params: {
            "period_start": DateFormatter.toYMD(
              _startDate ?? DateTime(2026, 4, 1),
            ),
            "period_end": DateFormatter.toYMD(
              _endDate ?? DateTime(2026, 4, 30),
            ),
            "period_key": "month",
            "indicator_to_mo_id": indicatorId,
            "field_name": fieldName,
            "field_value": value,
            "auth_user_id": "40",
          },
        );
      } catch (e) {
        emit(TaskState.error(e.toString()));
      }
    });
  }
}
