import 'package:bloc_provider_list/bloc_observer.dart';
import 'package:bloc_provider_list/settings_page/bloc/settings_bloc.dart';
import 'package:bloc_provider_list/settings_page/cubit/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_home_page/bloc/list_bloc.dart';
import 'my_home_page/my_home_page.dart';

void main() {
  BlocOverrides.runZoned(
      () => runApp(MultiBlocProvider(providers: [
            BlocProvider<ListBloc>(
              create: (context) => ListBloc(),
            ),
            BlocProvider(create: (context) => SettingsBloc()),
            BlocProvider(create: (context) => SwitchCubit()),
          ], child: const MyApp())),
      blocObserver: ListBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode settedThemeMode =
        context.select((SettingsBloc bloc) => bloc.state.themeMode);

    return MaterialApp(
      title: 'Flutter Bloc/Cubit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: settedThemeMode,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}
