import 'dart:async';
import '../models/item_model.dart';
import '../models/item_model.dart';
import '../models/item_model.dart';
import 'news_api_provider.dart';
import 'news_db_provider.dart';

class Repository {

  List<Source> sources = <Source>[
    NewsDbProvider(),
    NewsApiProvider()
  ];

  List<Cache> cached = <Cache>[
    NewsDbProvider()
  ];

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) return item;
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);
    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}