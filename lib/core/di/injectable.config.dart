// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/core/app_bloc_observer.dart' as _i206;
import 'package:app/core/di/register_modules.dart' as _i876;
import 'package:app/src/data/data_sources/task_remote_data_source.dart'
    as _i855;
import 'package:app/src/data/repositories/task_repository_impl.dart' as _i23;
import 'package:app/src/domain/repositories/task_repository.dart' as _i890;
import 'package:app/src/domain/use_cases/get_remote_tasks_use_case.dart'
    as _i167;
import 'package:app/src/presentation/cubit/task_cubit.dart' as _i685;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i974.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i206.AppBlocObserver>(
      () => registerModule.blocObserver(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio(gh<_i974.Logger>()));
    gh.lazySingleton<_i855.TaskRemoteDataSource>(
      () => _i855.TaskRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i890.TaskRepository>(
      () => _i23.TaskRepositoryImpl(gh<_i855.TaskRemoteDataSource>()),
    );
    gh.factory<_i167.GetRemoteTasksUseCase>(
      () => _i167.GetRemoteTasksUseCase(gh<_i890.TaskRepository>()),
    );
    gh.lazySingleton<_i685.TaskCubit>(
      () => _i685.TaskCubit(gh<_i167.GetRemoteTasksUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i876.RegisterModule {}
