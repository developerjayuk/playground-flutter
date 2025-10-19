import 'package:flutter/material.dart';
import 'package:widget_basics/src/screens/counter_page.dart';
import 'package:widget_basics/src/screens/profile_page.dart';
import 'package:widget_basics/src/screens/todo_page.dart';
import 'package:widget_basics/src/screens/travel_page.dart';
import 'package:widget_basics/src/widgets/grid_view_demo.dart';
import 'package:widget_basics/src/widgets/inputs_demo.dart';
import 'package:widget_basics/src/widgets/list_view_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                'Homepage',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterPage()),
                );
              },
              child: Text(
                'Counter',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoPage()),
                );
              },
              child: Text(
                'Todo App',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPage()),
                );
              },
              child: Text(
                'Travel',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewDemo()),
                );
              },
              child: Text(
                'Grid View Demo',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewDemo()),
                );
              },
              child: Text(
                'List View Demo',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputsDemo()),
                );
              },
              child: Text(
                'Inputs Demo',
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
