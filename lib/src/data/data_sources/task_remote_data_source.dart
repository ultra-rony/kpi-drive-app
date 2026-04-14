import 'package:app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class TaskRemoteDataSource {
  Future<Response> getTasks(Map<String, dynamic> map);

  Future<Response> updateTask(Map<String, dynamic> map);
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Dio _dio;

  TaskRemoteDataSourceImpl(this._dio);

  @override
  Future<Response<dynamic>> getTasks(Map<String, dynamic> map) async {
    return await _dio.post(
      "${Constants.baseUrl}/_api/indicators/get_mo_indicators",
      data: map,
    );
  }

  @override
  Future<Response<dynamic>> updateTask(Map<String, dynamic> map) async {
    return await _dio.post(
      "${Constants.baseUrl}/_api/indicators/save_indicator_instance_field",
      data: FormData.fromMap(map),
      options: Options(contentType: 'multipart/form-data'),
    );
  }
}
