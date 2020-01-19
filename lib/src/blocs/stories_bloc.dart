import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _item = BehaviorSubject<int>();

  Stream<List<int>> get topIds => _topIds.stream;

  Function(int) get fetchItem => _item.sink.add;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, _) {
      cache[id] = _repository.fetchItem(id);
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _topIds.close();
    _item.close();
  }
}
