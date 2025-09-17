import 'package:flutter/material.dart';
import 'blocs/bloc.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      bloc: Bloc(),
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(body: LoginScreen()),
      ),
    );
  }
}
