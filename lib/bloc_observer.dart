import 'package:bloc/bloc.dart';

class ListBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} ${change.currentState}');
  }
}
