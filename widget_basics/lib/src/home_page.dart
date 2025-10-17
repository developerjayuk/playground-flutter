import 'package:flutter/material.dart';
import 'package:widget_basics/src/screens/counter_page.dart';
import 'package:widget_basics/src/screens/profile_page.dart';
import 'package:widget_basics/src/screens/travel_page.dart';
import 'package:widget_basics/src/widgets/grid_view_demo.dart';
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Homepage', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterPage()),
                );
              },
              child: Text('Counter', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text('Profile', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPage()),
                );
              },
              child: Text('Travel', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewDemo()),
                );
              },
              child: Text('Grid View Demo', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50), backgroundColor: Colors.indigoAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewDemo()),
                );
              },
              child: Text('List View Demo', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
