import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  ListViewDemo({super.key});

  // dynamic list example
  final List<String> items = List.generate(100, (index) => 'Here is Item # ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List view example')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) => ListTile(
          tileColor: i.isEven ? Colors.grey : Colors.white,
          title: Text(items[i]),
          subtitle: Text('This is the subtitle'),
        ),
      ),
    );
  }
}