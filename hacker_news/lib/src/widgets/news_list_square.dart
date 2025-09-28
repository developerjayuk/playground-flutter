import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListSquare extends StatelessWidget {
  final int itemId;

  NewsListSquare({required this.itemId});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    print('Building NewsListSquare for itemId: $itemId');

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return Text('Stream still loading bruh!');
        }

        print('Stream has data, looking for itemId: $itemId');
        print('Available items: ${snapshot.data!.keys}');

        if (!snapshot.data!.containsKey(itemId)) {
          print('Item $itemId not found in stream, triggering fetch');
          bloc.fetchItem(itemId);
          return Text('Fetching item $itemId...');
        }

        return FutureBuilder(
          future: snapshot.data![itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (itemSnapshot.hasError) {
              print('Error: ${itemSnapshot.error}');
              return Text('Error loading item $itemId: ${itemSnapshot.error}');
            }
            if (!itemSnapshot.hasData) {
              return Text('Still loading item $itemId');
            }
            return buildSquare(itemSnapshot.data!);
          },
        );
      },
    );
  }

  Widget buildSquare(ItemModel item) {
    return ListTile(
      title: Text(item.title ?? ''),
      subtitle: Text('${item.score} points'),
    );
  }
}
