import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/router.dart';
import '../../widgets/search_input.dart';
import './left_nav.dart';
import './right_content.dart';
import './json.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            SearchInput(
              hintText: '网易云课堂',
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              disabled: true,
              onTab: () {
                Navigator.pushNamed(context, Router.searchPage);
              },
            ),
            Divider(height: 1),
            Expanded(
              child: Row(
                children: <Widget>[
                  LeftNav(navList: navList,),
                  Expanded(child: RightContent())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
