import 'package:hacker_news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of Ids', () async {
    // setup of test
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 3, 44, 197]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    // expectation
    expect(ids, [1, 3, 44, 197]);
  });

  test('FetchItem returns a list the Item', () async {
    // setup of test
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {
        'id': 99,
        'deleted': false,
        'type': 'story',
        'by': 'testuser',
        'time': 1234567890,
        'text': null,
        'dead': false,
        'parent': null,
        'kids': [],
        'url': 'https://example.com',
        'score': 10,
        'title': 'Test Story',
        'descendants': 5
      };
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);

    // expectation
    expect(item.id, 99);
  });
}
