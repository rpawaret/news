import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'dart:async';
import 'package:news/src/blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Text('Show a list'),
    );
  }
}
