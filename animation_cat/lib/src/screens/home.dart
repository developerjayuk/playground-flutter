import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    catAnimation = Tween(
      begin: -25.0,
      end: -80.0,
    ).animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));

    catAnimation.addStatusListener((status) {
      if (status.isCompleted) {
        boxController.stop();
      }
    });

    boxController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(CurvedAnimation(parent: boxController, curve: Curves.linear));

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    boxController.forward();
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      boxController.forward();
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
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
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
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(height: 5.0, width: 100.0, color: Colors.brown),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 2.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(height: 5.0, width: 100.0, color: Colors.brown),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }
}
