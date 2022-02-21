import 'dart:convert';

import '../model/todo/todo.dart';
import 'package:http/http.dart' as http;

class MyProvider {
  String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> getTodos() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<Todo> todos = [];
      for (var todo in jsonResponse) {
        todos.add(Todo.fromJson(todo));
      }
      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
