import 'package:flutter/material.dart';

void showResult({
  required BuildContext context,
  required String title,
  required String body,
  required VoidCallback onPlayAgain,
  required VoidCallback onCancel,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Row(children: [Icon(Icons.exit_to_app), Text(' - Quit')]),
        ),
        TextButton(
          onPressed: onPlayAgain,
          child: Row(children: [Icon(Icons.restore), Text(' - Play Again')]),
        ),
      ],
    ),
  );
}

void showMessage(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
