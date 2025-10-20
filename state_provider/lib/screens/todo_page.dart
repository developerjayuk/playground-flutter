import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/models/priority.dart';
import 'package:state_provider/models/todo.dart';
import 'package:state_provider/providers/todo_app_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  Priority priority = Priority.medium;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoAppProvider(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTodo(context);
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: Text('Todo List')),
        body: Provider.of<TodoAppProvider>(context, listen: true).todos.isEmpty
            ? Center(child: Text('There is nothing to do!'))
            : ListView.builder(
                itemCount: Provider.of<TodoAppProvider>(
                  context,
                  listen: true,
                ).todos.length,
                itemBuilder: (context, index) {
                  final todo = Provider.of<TodoAppProvider>(
                    context,
                    listen: true,
                  ).todos[index];
                  return TodoItem(
                    todo: todo,
                    onChanged: (value) {
                      Provider.of<TodoAppProvider>(
                        context,
                        listen: false,
                      ).setCompleted(index, value);
                    },
                  );
                },
              ),
      ),
    );
  }

  void addTodo(BuildContext context) {
    final provider = Provider.of<TodoAppProvider>(context, listen: false);
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
                            groupValue: provider.todoPriority,
                            onChanged: (value) {
                              Provider.of<TodoAppProvider>(
                                context,
                                listen: false,
                              ).todoPriority = value!;
                            },
                          ),
                          Text(Priority.low.name),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Priority>(
                            value: Priority.medium,
                            groupValue: provider.todoPriority,
                            onChanged: (value) {
                              Provider.of<TodoAppProvider>(
                                context,
                                listen: false,
                              ).todoPriority = value!;
                            },
                          ),
                          Text(Priority.medium.name),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Priority>(
                            value: Priority.high,
                            groupValue: provider.todoPriority,
                            onChanged: (value) {
                              Provider.of<TodoAppProvider>(
                                context,
                                listen: false,
                              ).todoPriority = value!;
                            },
                          ),
                          Text(Priority.high.name),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => _save(context),
                    child: Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _save(BuildContext context) {
    final provider = Provider.of<TodoAppProvider>(context, listen: false);

    if (_controller.text.isEmpty) {
      showMessage(context, 'You must enter a todo item');
      return;
    }

    final todo = MyTodo(
      id: DateTime.now().millisecondsSinceEpoch,
      name: _controller.text,
      priority: provider.todoPriority,
    );

    provider.addTodo(todo);

    // clear input and close
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
