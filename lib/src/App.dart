import 'package:flutter/material.dart';
import 'package:news/src/screens/news_list.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/screens/news_detail.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return NewsList();
      });
    } else {
      return MaterialPageRoute(builder: (BuildContext context) {
        // extract the item id from settings.name
        // and pass into NewsDetail
        return NewsDetail();
      });
    }
  }
}
