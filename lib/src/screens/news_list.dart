import 'package:flutter/material.dart';
import 'dart:async';
import 'package:news/src/blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds(); // BAD

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: bulidList(bloc),
    );
  }
}

Widget bulidList(StoriesBloc bloc) {
  return StreamBuilder(
    stream: bloc.topIds,
    builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
      if (!snapshot.hasData) {
        return Text('Still waiting on Ids');
      } else {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text('${snapshot.data[index]}');
          },
        );
      }
    },
  );
}
