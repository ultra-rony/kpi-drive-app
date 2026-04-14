import 'package:app/core/network/network_result.dart';
import 'package:app/core/use_case.dart';
import 'package:app/src/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateRemoteTaskUseCase
    implements UseCase<Result<int?>, Map<String, dynamic>?> {
  final TaskRepository _repository;

  UpdateRemoteTaskUseCase(this._repository);

  @override
  Future<Result<int?>> call({Map<String, dynamic>? params}) async {
    return await _repository.updateTask(params ?? {});
  }
}
