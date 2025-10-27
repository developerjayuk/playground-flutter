import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_router/page_one.dart';
import 'package:navigation_router/page_profile.dart';
import 'package:navigation_router/page_two.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageOne.routeName);
              },
              child: const Text('Page 1'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageTwo.routeName, extra: 'Hello there');
              },
              child: const Text('Page 2'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageProfile.routeName,
                pathParameters: {'id': 'abc123'});
              },
              child: const Text('Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}
