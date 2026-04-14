import 'package:app/core/network/network_result.dart';
import 'package:app/src/data/data_sources/task_remote_data_source.dart';
import 'package:app/src/data/mappers/task_mapper.dart';
import 'package:app/src/data/models/task_model.dart';
import 'package:app/src/domain/entities/task_entity.dart';
import 'package:app/src/domain/repositories/task_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;

  TaskRepositoryImpl(this._taskRemoteDataSource);

  @override
  Future<Result<List<TaskEntity>?>> getTasks(Map<String, dynamic> map) async {
    try {
      final httpResponse = await _taskRemoteDataSource.getTasks(map);
      if (httpResponse.statusCode == 200 && httpResponse.data != null) {
        if (httpResponse.data == null) {
          return const Failure('No tasks found in response');
        }
        final entities = (httpResponse.data['DATA']['rows'] as List<dynamic>)
            .map<TaskEntity>(
              (json) =>
                  TaskModel.fromJson(json as Map<String, dynamic>).toEntity(),
            )
            .toList();
        return Success(entities);
      }
      return Failure(
        'Unexpected response: ${httpResponse.statusCode} ${httpResponse.data}',
      );
    } on DioException catch (e) {
      return Failure('Dio error: ${e.response?.statusCode ?? ''} ${e.message}');
    } catch (e) {
      return Failure('Unexpected error: $e');
    }
  }
}
