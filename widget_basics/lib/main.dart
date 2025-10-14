import 'package:flutter/material.dart';
import 'package:widget_basics/src/screens/profile_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilePage(),
        '/business': (context) => ProfilePage(),
        // Add more routes as needed
      },
    ),
  );
}
