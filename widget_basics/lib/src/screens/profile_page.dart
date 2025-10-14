import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Stack(children: [backgroundSection(), floatingCardSection()]),
    );
  }

  Stack floatingCardSection() {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          top: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Julius Jones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Software Developer',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                mediaButtonSection(),
                socialMediaStatSection(),
                const FollowersSection(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'FOLLOW NOW',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        roundProfileImage(),
      ],
    );
  }

  Positioned roundProfileImage() {
    return Positioned(
      left: 0,
      right: 0,
      top: 50,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }

  Padding socialMediaStatSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '240',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'FOLLOWING',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '24K',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'FOLLOWER',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding mediaButtonSection() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaButton(filled: true, icon: Icons.call),
          SocialMediaButton(filled: false, icon: Icons.near_me),
          SocialMediaButton(filled: false, icon: Icons.share),
          SocialMediaButton(filled: false, icon: Icons.sms),
          SocialMediaButton(filled: false, icon: Icons.email),
        ],
      ),
    );
  }

  Column backgroundSection() {
    return Column(
      children: [
        Image.network(
          'https://c4.wallpaperflare.com/wallpaper/514/716/58/full-moon-dark-mountains-wallpaper-preview.jpg',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final bool filled;
  final IconData? icon;

  const SocialMediaButton({super.key, this.filled = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: filled ? Colors.blue : null,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.lightBlueAccent),
      ),
      child: Icon(icon, color: filled ? Colors.white : Colors.black),
    );
  }
}

class FollowersSection extends StatelessWidget {
  const FollowersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      height: 120,
      color: Colors.blue.withValues(alpha: 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 250,
            child: Stack(
              //alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu37yszC1fJabJPcWI-ZBTea0MWQi-iuwnUQ&s',
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDmOItYPOUlxHcvrJ6T8K7-EvrzX6GPCuUaA&s',
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqsI5MvUHV3k5aXKu4KD9-AhDXMG82OROD8g&s',
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQED3w5SbDZXdZZpmxm-ksKZ1m_rq5jNnoI7g&s',
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTGF0kA6qDapKWDT9FfYz4RViSYzauIZBbLQ&s',
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyDUaRsy4CNV8xp02YRZa_9s0cEQVsJPHfpg&s',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('22 FOLLOW YOU NOW', style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
