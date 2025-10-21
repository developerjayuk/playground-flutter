import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wurdle_game/providers/wurdle_provider.dart';
import 'package:wurdle_game/screens/wurdle_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => WurdleProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wurdle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: WurdlePage(),
      builder: EasyLoading.init()
    );
  }
}

