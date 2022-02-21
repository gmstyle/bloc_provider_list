part of 'switch_cubit.dart';

abstract class SwitchState extends Equatable {
  final bool switchIsOn;
  const SwitchState(this.switchIsOn);

  @override
  List<Object> get props => [switchIsOn];
}

class SwitchInitialState extends SwitchState {
  final bool switchIsOn;
  const SwitchInitialState({required this.switchIsOn}) : super(switchIsOn);
}

class SetSwitchState extends SwitchState {
  final bool switchIsOn;

  const SetSwitchState({required this.switchIsOn}) : super(switchIsOn);
  @override
  List<Object> get props => [switchIsOn];
}
