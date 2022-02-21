import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(const SwitchInitialState(switchIsOn: false));

  void toggleSwitch(bool isOn) {
    emit(SetSwitchState(switchIsOn: isOn));
  }
}
