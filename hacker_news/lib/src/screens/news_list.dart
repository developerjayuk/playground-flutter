import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_square.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, int index) {
              final id = snapshot.data![index];
              bloc.fetchItem(id);

              return NewsListSquare(itemId: id);
            },
          ),
        );
      },
    );
  }
}
