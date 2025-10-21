import 'package:flutter/material.dart';
import 'package:wurdle_game/models/wurdle.dart';

class WurdleView extends StatelessWidget {
  final Wurdle wurdle;
  const WurdleView({super.key, required this.wurdle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: wurdle.isInTarget ? Colors.white30 :
               wurdle.isNotInTarget ? Colors.blueGrey : null,
        border: Border.all(
          color: Colors.amber,
          width: 1.5
        )
      ),
      child: Text(wurdle.letter, style: TextStyle(
        fontSize: 16,
        color: wurdle.isInTarget ? Colors.black :
               wurdle.isNotInTarget ? Colors.white : Colors.white,
      )),
    );
  }
}
