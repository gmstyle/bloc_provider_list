import 'package:bloc/bloc.dart';
import 'package:bloc_provider_list/data/my_repository.dart';
import 'package:bloc_provider_list/model/todo/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final MyRepository repository = MyRepository();

  final List<Todo> emptyList = [];

  ListBloc() : super(ListInitialState()) {
    on<FetchTodosEvent>((event, emit) async {
      await repository.getTodos().then((todos) {
        emit(ListLoadedState(todos));
      }).catchError((error) {
        emit(ListErrorState());
      });
    });

    on<ClearTodosEvent>(((event, emit) => emit(ListClearedState(emptyList))));
  }
}
