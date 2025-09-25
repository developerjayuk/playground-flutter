import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(),
    );
  }


}
