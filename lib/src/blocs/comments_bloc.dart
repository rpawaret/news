import 'dart:async';

import 'package:rxdart/subjects.dart';

import '../models/item_model.dart';

class CommentsBloc {
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  // Streams
  Stream<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

  // Sinks
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
