import 'package:app/core/network/network_result.dart';
import 'package:app/core/use_case.dart';
import 'package:app/src/domain/entities/task_entity.dart';
import 'package:app/src/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRemoteTasksUseCase
    implements UseCase<Result<List<TaskEntity>?>, Map<String, dynamic>?> {
  final TaskRepository _repository;

  GetRemoteTasksUseCase(this._repository);

  @override
  Future<Result<List<TaskEntity>?>> call({Map<String, dynamic>? params}) async {
    return await _repository.getTasks(params ?? {});
  }
}
