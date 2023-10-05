import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stevevionnet/core/cubit/navigation_cubit/navigation_todo_cubit.dart';
import 'package:stevevionnet/core/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationToDoCubit>(
      create: (context) => NavigationToDoCubit(),
      child: MaterialApp.router(
        title: 'Laurie World',
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blueAccent,
                brightness: Brightness.light
            )
        ),
        darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent
            )
        ),
        routerConfig: routes,
      ),
    );
  }
}
