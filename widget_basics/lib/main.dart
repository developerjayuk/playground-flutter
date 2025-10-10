import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(title: Text('Home page'), centerTitle: true),
        body: Center(
          child: Text('Hello Flutter', style: TextStyle(fontSize: 40.0)),
        ),
      ),
    ),
  );
}
