import 'package:flutter/material.dart';
import 'package:widget_basics/src/components/action_menu_item.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel')),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      // appBar: AppBar(title: Text('Home page'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://www.muchbetteradventures.com/magazine/content/images/size/w2000/2025/03/lake-atitlan-guatemala.jpg',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 20.0,
                  child: Text(
                    'Guatemala',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      ActionMenuItem(
                        icon: Icons.favorite,
                        label: 'Save',
                        color: Colors.red,
                      ),
                      ActionMenuItem(
                        icon: Icons.map,
                        label: 'Maps',
                        color: Colors.blueAccent,
                      ),
                      ActionMenuItem(
                        icon: Icons.share,
                        label: 'Share',
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    '''Lake Atitlán is ringed with volcanoes, which offer some adventurous trekking opportunities. One of the most popular is an ascent of Volcán San Pedro (3,020m/9,908ft), where you'll hike on a steep path up through the cloud forest. Through clearings in the forest, you'll catch a glimpse of the glimmering lake below, and the volcanoes encircling it.''',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    '''One of the best ways to explore Lago Atitlán is on water. Rent a kayak and paddle across the glassy waters, gliding past the lakeside villages and pulling ashore to swim in hidden coves at your own pace.''',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
