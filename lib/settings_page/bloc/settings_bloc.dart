import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const InitialThemeState(themeMode: ThemeMode.system)) {
    on<ToggleSwitchManualThemeEvent>((event, emit) {
      if (state.themeMode == ThemeMode.light) {
        emit(const SetThemeState(themeMode: ThemeMode.dark));
      } else {
        emit(const SetThemeState(themeMode: ThemeMode.light));
      }
    });

    on<CheckSystemThemeEvent>((event, emit) {
      if (state.themeMode != ThemeMode.system) {
        emit(const InitialThemeState(themeMode: ThemeMode.system));
      } else {
        emit(const SetThemeState(themeMode: ThemeMode.light));
      }
    });
  }
}
