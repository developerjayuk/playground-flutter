import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Home(),
    );
  }
}
