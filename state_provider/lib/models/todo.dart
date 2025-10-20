// CLASSES
import 'package:state_provider/models/priority.dart';

class MyTodo {
  int id;
  String name;
  bool completed;
  Priority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });
}