import 'package:flutter/material.dart';
import '../../../constant/index.dart';
import 'package:netease_cloud_classroom/widgets/my_icons.dart';

class HotPanel extends StatefulWidget {
  @override
  _HotPanelState createState() => _HotPanelState();
}

class _HotPanelState extends State<HotPanel> {
  final List<String> hotList = ['互联网是怎么跟广告业抢饭吃的', '中国哪个姓氏最厉害'];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.only(bottom: 9),
      child: Column(
        children: <Widget>[
          Image.asset(
            Constant.ASSETS_IMG + 'temp/post.png',
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        MyIcons.fire,
                        size: 23,
                        color: Color.fromRGBO(238, 88, 88, 1),
                      ),
                    ),
                    Text(
                      '今日热门',
                      style: TextStyle(
                        color: Color.fromRGBO(80, 80, 80, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                ...hotList
                    .map(
                      (text) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 14.0, left: 8),
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 5,
                              color: Color.fromRGBO(128, 128, 128, 1),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              text,
                              style: TextStyle(
                                color: Color.fromRGBO(80, 80, 80, 1),
                                fontSize: 14,
                                height: 2,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
