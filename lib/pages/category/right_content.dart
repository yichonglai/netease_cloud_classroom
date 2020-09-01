import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import './nav_panel.dart';
import './json.dart';

class RightContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        itemCount: contentList.length,
        itemBuilder: (BuildContext context, int idx) {
          return contentList[idx].type == 0
              ? InkWell(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              Constant.ASSETS_IMG + contentList[idx].pic),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )
              : NavPanel(
                  title: contentList[idx].title,
                  data: contentList[idx].data,
                );
        },
      ),
    );
  }
}
