part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final ThemeMode themeMode;

  const SettingsState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

class InitialThemeState extends SettingsState {
  const InitialThemeState({required ThemeMode themeMode})
      : super(themeMode: themeMode);
}

class SetThemeState extends SettingsState {
  const SetThemeState({required ThemeMode themeMode})
      : super(themeMode: themeMode);

  @override
  List<Object> get props => [themeMode];
}
