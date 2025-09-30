import 'package:flutter/material.dart';
import '../widgets/loading_container.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';

class NewsListSquare extends StatelessWidget {
  final int itemId;

  const NewsListSquare({super.key, required this.itemId});

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    print('Building NewsListSquare for itemId: $itemId');

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

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
              return LoadingContainer();
            }
            return buildSquare(context, itemSnapshot.data!);
          },
        );
      },
    );
  }

  Widget buildSquare(BuildContext context, ItemModel item) {
    return Column(
      children: [
        ListTile(
          title: Text(item.title ?? ''),
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [Icon(Icons.comment), Text('${item.descendants}')],
          ),
          onTap: () {
            print('Item was tapped: ${item.id}');
            Navigator.pushNamed(context, '/${item.id}');
          },
        ),
        Divider(height: 8.0),
      ],
    );
  }
}
