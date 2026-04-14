import 'package:app/core/app_bloc_observer.dart';
import 'package:app/core/network/app_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  AppBlocObserver blocObserver(Logger logger) => AppBlocObserver(logger);

  @lazySingleton
  Dio dio(Logger logger) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    dio.interceptors.add(AppInterceptor(logger));
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPreferences async {
    return await SharedPreferences.getInstance();
  }
}