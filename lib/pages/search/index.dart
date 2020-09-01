import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/widgets/search_input.dart';
import './cache_panel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SearchInput(
              hintText: '网易云课堂',
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 13,
                right: 13,
                bottom: 10,
              ),
            ),
            CachePanel(
                title: '搜索历史',
                onCancel: () {},
                data: ['前端', 'flutter',]),
            CachePanel(
                title: '热门搜索', data: ['资深前端架构师', '汇编语言', '深度学习', '线性', '学习', '3dmax'])
          ],
        ));
  }
}
