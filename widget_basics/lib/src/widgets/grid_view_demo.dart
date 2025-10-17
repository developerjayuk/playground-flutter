import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  GridViewDemo({super.key});

  // dynamic list example
  final List<String> items = List.generate(
    50,
    (index) => 'Here is Item # ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid view example')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.25,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) =>
            Card(child: Center(child: Text(items[index]))),
      ),
    );
  }
}
