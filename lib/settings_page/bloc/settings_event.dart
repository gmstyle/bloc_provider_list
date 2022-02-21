part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ToggleSwitchManualThemeEvent extends SettingsEvent {
  final bool value;

  const ToggleSwitchManualThemeEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class CheckSystemThemeEvent extends SettingsEvent {
  final bool value;

  const CheckSystemThemeEvent({required this.value});

  @override
  List<Object> get props => [value];
}
