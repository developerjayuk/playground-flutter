import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  const Comment({
    super.key,
    required this.itemId,
    required this.itemMap,
    required this.depth,
  });

  @override
  Widget build(context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final item = snapshot.data;

        if (item != null) {
          final children = <Widget>[
            ListTile(
              title: buildText(item),
              subtitle: Text(item.by == '' ? 'Deleted' : item.by ?? 'n/a'),
              contentPadding: EdgeInsets.only(
                right: 16.0,
                left: (depth + 1) * 16.0,
              ),
            ),
            Divider(),
          ];

          item.kids?.forEach((kidId) {
            children.add(
              Comment(itemId: kidId, itemMap: itemMap, depth: depth + 1),
            );
          });

          return Column(children: children);
        }

        // return nothing
        return SizedBox.shrink();
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        ?.replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '')
        .replaceAll('&#x27;', "'");

    return Text(text ?? 'n/a');
  }
}
