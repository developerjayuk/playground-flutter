import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
/// The line `floatingActionButton: FloatingActionButton(onPressed: onPressed),` is setting the floating
/// action button for the Scaffold widget in the Flutter app. The `FloatingActionButton` widget creates
/// a button typically placed in the bottom right corner of the screen that performs a specific action
/// when pressed. In this case, the `onPressed` property is set to a function named `onPressed`, which
/// will be called when the button is pressed.
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('Hi there!');
          },
        ),
      appBar: AppBar(
        title: Text("Let's see some pixs!")),
    )
  );

  runApp(app);
}


