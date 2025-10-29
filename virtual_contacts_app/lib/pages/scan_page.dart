import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  static const String routeName = '/scan';
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner')),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Capture'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(Icons.photo_album),
                label: const Text('Gallery'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
