import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> todos = [];
  final _controller = TextEditingController();
  Priority todoPriority = Priority.medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Todo List')),
      body: MyTodo.todos.isEmpty
          ? Center(child: Text('There is nothing to do!'))
          : ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return TodoItem(
                  todo: todo,
                  onChanged: (value) {
                    setState(() {
                      MyTodo.todos[index].completed = value;
                    });
                  },
                );
              },
            ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setBuilderState) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'New Todo Item'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Select the priority: '),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<Priority>(
                            value: Priority.low,
                            groupValue: todoPriority,
                            onChanged: (value) {
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            },
                          ),
                          Text(Priority.low.name),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Priority>(
                            value: Priority.medium,
                            groupValue: todoPriority,
                            onChanged: (value) {
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            },
                          ),
                          Text(Priority.medium.name),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Priority>(
                            value: Priority.high,
                            groupValue: todoPriority,
                            onChanged: (value) {
                              setBuilderState(() {
                                todoPriority = value!;
                              });
                            },
                          ),
                          Text(Priority.high.name),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(onPressed: _save, child: Text('Save')),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMessage(context, 'You must enter a todo item');
      return;
    }

    final todo = MyTodo(
      id: DateTime.now().millisecondsSinceEpoch,
      name: _controller.text,
      priority: todoPriority,
    );

    MyTodo.todos.add(todo);

    setState(() {});
    _controller.clear();
    Navigator.pop(context);
  }
}

// GLOBAL FUNCTION
void showMessage(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Stack(
        children: [
          Text('Warning'),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      content: Text(s),
    ),
  );
}

// CLASSES
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

  static List<MyTodo> todos = [];
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onChanged});

  final MyTodo todo;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todo.name),
      subtitle: Text('Priority: ${todo.priority.name}'),
      value: todo.completed,
      onChanged: (value) {
        todo.completed = value!;
        onChanged(value);
      },
    );
  }
}

// ENUMS
enum Priority { high, medium, low }
