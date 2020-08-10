import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/widgets/static_search_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: TabBar(
          indicatorWeight: 2.0,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color.fromRGBO(51, 177, 123, 1),
          labelColor: Color.fromRGBO(51, 177, 123, 1),
          labelStyle: TextStyle(fontSize: 14),
          unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
          tabs: <Widget>[
            Tab(text: '个性推荐'),
            Tab(text: '课堂'),
            Tab(text: '微专业'),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Text('个性推荐'),
            Text('课堂'),
            Text('微专业'),
          ],
        ),
      ),
    );
  }
}
