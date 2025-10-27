import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_router/home_page.dart';
import 'package:navigation_router/page_one.dart';
import 'package:navigation_router/page_one_details.dart';
import 'package:navigation_router/page_profile.dart';
import 'package:navigation_router/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Navigation',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: HomePage.routeName,
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: PageProfile.routeName,
            path: '/profile/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return PageProfile(id: id ?? '');
            },
          ),
        ],
      ),
      GoRoute(
        name: PageOne.routeName,
        path: '/one',
        builder: (context, state) => const PageOne(),
        routes: [
          GoRoute(
            name: PageOneDetails.routeName,
            path: '/one_details',
            builder: (context, state) => const PageOneDetails(),
          ),
        ],
      ),
      GoRoute(
        name: PageTwo.routeName,
        path: '/two',
        builder: (context, state) {
          final msg = state.extra! as String;
          return PageTwo(message: msg);
        },
      ),
    ],
  );
}
