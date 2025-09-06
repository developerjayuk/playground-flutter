import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'),
    );

    /// The line `var imageModel = ImageModel.fromJson(json.decode(response.body));` is decoding the
    /// JSON response body obtained from an HTTP request and converting it into an `ImageModel` object
    /// using a factory method `fromJson` defined in the `ImageModel` class.
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    print(imageModel);

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        /// The line `floatingActionButton: FloatingActionButton(onPressed: onPressed),` is setting the floating
        /// action button for the Scaffold widget in the Flutter app. The `FloatingActionButton` widget creates
        /// a button typically placed in the bottom right corner of the screen that performs a specific action
        /// when pressed. In this case, the `onPressed` property is set to a function named `onPressed`, which
        /// will be called when the button is pressed.
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: Text("Let's see some pixs!")),
      ),
    );
  }
}
