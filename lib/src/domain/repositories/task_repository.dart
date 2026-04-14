import 'package:app/core/network/network_result.dart';
import 'package:app/src/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>?>> getTasks(Map<String, dynamic> map);
}
