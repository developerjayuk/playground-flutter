import 'package:flutter/material.dart';
import 'package:widget_basics/src/screens/profile_page.dart';
import 'package:widget_basics/src/screens/todo_page.dart';
import 'package:widget_basics/src/screens/travel_page.dart';
import 'package:widget_basics/src/widgets/grid_view_demo.dart';
import 'package:widget_basics/src/widgets/list_view_demo.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TodoPage(),
        '/profile': (context) => ProfilePage(),
        '/travel': (context) => TravelPage(),
        '/listview': (context) => ListViewDemo(),
        '/gridview': (context) => GridViewDemo(),
        
        // Add more routes as needed
      },
    ),
  );
}
