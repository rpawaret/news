import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();

  Stream<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> cache, int id, _) {},
        <int, Future<ItemModel>>{});
  }

  dispose() {
    _topIds.close();
  }
}
