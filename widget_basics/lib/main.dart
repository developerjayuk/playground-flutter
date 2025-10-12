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
        // appBar: AppBar(title: Text('Home page'), centerTitle: true),
        body: Column(
          children: [
            Image.network(
              'https://www.muchbetteradventures.com/magazine/content/images/size/w2000/2025/03/lake-atitlan-guatemala.jpg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lake Atitlán',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Magical nature!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('8.5', style: TextStyle(fontSize: 20.0)),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.call, color: Colors.blueAccent),
                          Text(
                            'Call',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.favorite, color: Colors.blueAccent),
                          Text(
                            'Maps',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share, color: Colors.blueAccent),
                          Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    '''Lake Atitlán is ringed with volcanoes, which offer some adventurous trekking opportunities. One of the most popular is an ascent of Volcán San Pedro (3,020m/9,908ft), where you'll hike on a steep path up through the cloud forest. Through clearings in the forest, you'll catch a glimpse of the glimmering lake below, and the volcanoes encircling it.''',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
