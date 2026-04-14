import 'package:app/core/network/network_result.dart';
import 'package:app/src/domain/entities/task_entity.dart';
import 'package:app/src/domain/use_cases/get_remote_tasks_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_state.dart';

part 'task_cubit.freezed.dart';

@LazySingleton()
class TaskCubit extends Cubit<TaskState> {
  final GetRemoteTasksUseCase _getTasks;

  TaskCubit(this._getTasks) : super(const TaskState.initial());

  Future<void> loadTasks() async {
    emit(const TaskState.loading());

    try {
      final resp = await _getTasks(
        params: {
          "period_start": "2026-04-01",
          "period_end": "2026-04-30",
          "period_key": "month",
          "requested_mo_id": "42",
          "behaviour_key": "task,kpi_task",
          "with_result": "false",
          "response_fields": "name,indicator_to_mo_id,parent_id,order",
          "auth_user_id": "40",
        },
      );
      if (resp is Success) {
        if (resp.data?.isEmpty == true) {
          emit(const TaskState.empty());
          return;
        }
        final grouped = _mapTasks(resp.data ?? []);
        emit(TaskState.loaded(grouped));
      }
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }

  /// 🔹 Сортировка + группировка
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
}
