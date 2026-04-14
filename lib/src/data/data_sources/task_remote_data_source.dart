import 'package:app/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class TaskRemoteDataSource {
  Future<Response> getTasks(Map<String, dynamic> map);
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Dio _dio;

  TaskRemoteDataSourceImpl(this._dio);

  @override
  Future<Response<dynamic>> getTasks(Map<String, dynamic> map) async {
    return await _dio.post(
      "${Constants.baseUrl}/_api/indicators/get_mo_indicators",
        options: Options(
          headers: {
            "Authorization": "Bearer 5c3964b8e3ee4755f2cc0febb851e2f8",
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
      data: map
    );
  }
}
