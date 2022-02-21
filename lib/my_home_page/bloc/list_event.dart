part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {}

class FetchTodosEvent extends ListEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ClearTodosEvent extends ListEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
