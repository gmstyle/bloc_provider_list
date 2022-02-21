import 'package:bloc_provider_list/data/my_provider.dart';
import 'package:bloc_provider_list/model/todo/todo.dart';

class MyRepository {
  final MyProvider _myProvider = MyProvider();

  Future<List<Todo>> getTodos() => _myProvider.getTodos();
}
