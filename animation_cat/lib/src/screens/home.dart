import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;

  @override
  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 750),
      vsync: this,
    );

    catAnimation = Tween(
      begin: -25.0,
      end: -80.0,
    ).animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Cat!')),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [buildCatAnimation(), buildBox(), buildLeftFlap()],
          ),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
          child: child!,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(height: 200.0, width: 200.0, color: Colors.brown);
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 2.0,
      child: Transform.rotate(
        angle: pi / 1.7,
        alignment: Alignment.topLeft,
        child: Container(height: 5.0, width: 100.0, color: Colors.brown),
      ),
    );
  }
}
