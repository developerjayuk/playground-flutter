import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

final _base = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get(Uri.parse('$_base/topstories.json'));

    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_base/$id.json'));

    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
