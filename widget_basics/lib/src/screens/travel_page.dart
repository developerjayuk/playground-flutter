import 'package:flutter/material.dart';
import 'package:widget_basics/src/components/action_menu_item.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  int imageIndex = 0;
  List<String> images = [
    "https://johnnyafrica.com/wp-content/uploads/2018/01/305657-mountain-view.jpg",
    "https://passportpilgrimage.com/wp-content/uploads/2024/01/Indian-Nose-Hike.png",
    "https://i0.wp.com/wareontheglobe.com/wp-content/uploads/2024/08/IMG_9464.jpeg?resize=705%2C435&ssl=1",
    "https://travelwithneweyes.com/wp-content/uploads/2023/01/20221027_090802-min.jpg",
    "https://weareglobaltravellers.com/wp-content/uploads/2022/02/We-Are-Global-Travellers-Best-things-to-do-in-Lake-Atitlan-Guatemala-2.jpg",
  ];

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
                  images[imageIndex],
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
                Positioned(
                  bottom: 10.0,
                  right: 20.0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (imageIndex < images.length - 2) {
                          imageIndex++;
                        } else {
                          imageIndex = 0;
                        }
                      });
                    },
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.yellow,
                      size: 40,
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
