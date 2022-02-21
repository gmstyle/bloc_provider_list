part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListInitialState extends ListState {}

class ListLoadingState extends ListState {}

class ListLoadedState extends ListState {
  final List<Todo> todos;

  ListLoadedState(this.todos);
}

class ListErrorState extends ListState {}

class ListClearedState extends ListState {
  final List<Todo> todos;

  ListClearedState(this.todos);
}
