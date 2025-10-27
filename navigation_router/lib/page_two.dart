import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  static const String routeName = 'two';
  final String message;

  const PageTwo({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(message)
          ],
        ),
      ),
    );
  }
}
