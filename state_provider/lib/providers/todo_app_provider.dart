import 'package:flutter/material.dart';
import 'package:state_provider/models/priority.dart';
import 'package:state_provider/models/todo.dart';

class TodoAppProvider extends ChangeNotifier {
  final List<MyTodo> _todos = [];
  List<MyTodo> get todos => _todos;
  
  Priority _todoPriority = Priority.medium;
  Priority get todoPriority => _todoPriority;
  set todoPriority(Priority value) {
    _todoPriority = value;
    notifyListeners();
  }

  void addTodo(MyTodo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void setCompleted(int index, bool value) {
    _todos[index].completed = value;
    notifyListeners();
  }
}
