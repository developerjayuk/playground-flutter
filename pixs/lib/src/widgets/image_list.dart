import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.all(20.0),
          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Banana-Single.jpg/1162px-Banana-Single.jpg'),
          // child: Image.network(images[index].url),
        );
      },
    );
  }
}