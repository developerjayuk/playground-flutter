import 'package:flutter/material.dart';

class PageProfile extends StatelessWidget {
  static const String routeName = 'profile';
  final String id;

  const PageProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('Id is $id')],
        ),
      ),
    );
  }
}
