import 'package:bloc_provider_list/settings_page/bloc/settings_bloc.dart';
import 'package:bloc_provider_list/settings_page/cubit/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var brightness = MediaQuery.of(context).platformBrightness;
    //bool isDarkMode = brightness == Brightness.dark ? true : false;

    ThemeMode _themeMode =
        context.select((SettingsBloc bloc) => bloc.state.themeMode);

    bool isDarkMode = _themeMode == ThemeMode.dark ? true : false;

    bool? isSystemThemeActive = _themeMode == ThemeMode.system ? true : false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return CheckboxListTile(
                  title: const Text("System theme mode"),
                  value: isSystemThemeActive,
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(CheckSystemThemeEvent(value: value!));
                    isSystemThemeActive = value;
                  },
                  controlAffinity: ListTileControlAffinity.trailing);
            },
          ),
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return SwitchListTile(
                title: Text(
                    isDarkMode ? 'Deactivate dark mode' : 'Activate dark mode'),
                value: isDarkMode,
                onChanged: isSystemThemeActive!
                    ? null
                    : (value) {
                        BlocProvider.of<SettingsBloc>(context)
                            .add(ToggleSwitchManualThemeEvent(value: value));
                        isDarkMode = value;
                      },
              );
            },
          ),
          BlocBuilder<SwitchCubit, SwitchState>(
            builder: (context, state) {
              return SwitchListTile(
                  title: Text('Cubit switch test: ${state.switchIsOn}'),
                  value: state.switchIsOn,
                  onChanged: (value) {
                    context.read<SwitchCubit>().toggleSwitch(value);
                  });
            },
          )
        ],
      ),
    );
  }
}
