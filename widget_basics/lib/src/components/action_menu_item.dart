import 'package:flutter/material.dart';

class ActionMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  
  const ActionMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(
          label,
          style: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
        ),
      ],
    );
  }
}