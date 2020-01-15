import 'package:http/testing.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';

void main() {
  test('FetchTopIds returns a list ids', () async {
    // setup of test case
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    final ids = await newsApi.fetchTopIds();
    // expectation
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns a item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });
    final item = await newsApi.fetchItem(123);
    expect(item.id, 123);
  });
}
