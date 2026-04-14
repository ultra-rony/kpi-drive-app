import 'package:app/app/router/app_router.dart';
import 'package:app/app/theme/app_theme.dart';
import 'package:app/core/di/injectable.dart';
import 'package:app/src/presentation/cubit/task_cubit.dart';
import 'package:app/src/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubit>(create: (_) => getIt<TaskCubit>()),
        BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            locale: const Locale('ru'),
            supportedLocales: const [Locale('ru')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
