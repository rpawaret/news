import 'package:flutter/material.dart';
import 'package:news/src/screens/news_list.dart';
import 'package:news/src/blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return NewsList();
          });
        },
      ),
    );
  }
}
