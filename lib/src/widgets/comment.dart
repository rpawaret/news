import 'dart:async';
import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return Text('Still loading comment');
        }

        final item = snapshot.data;

        var children = <Widget>[
          ListTile(
            title: buildText(item),
            subtitle: item.by == "" ? Text('Deleted') : Text(item.by),
            contentPadding:
                EdgeInsets.only(right: 16.0, left: (depth + 1) * 16.0),
          ),
          Divider()
        ];
        item.kids.forEach((kidId) {
          children.add(Comment(
            itemId: itemId,
            itemMap: itemMap,
            depth: depth + 1,
          ));
        });
        return Column(
          children: children,
        );
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        .replaceAll('&#x27', " ' ")
        .replaceAll('<p>', "\n\n")
        .replaceAll('</p>', '');

    return Text(text);
  }
}
