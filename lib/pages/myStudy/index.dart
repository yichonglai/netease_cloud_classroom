import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/index.dart';
import 'package:netease_cloud_classroom/widgets/text_line_height.dart';

class MyStudy extends StatelessWidget {
  final Color _bgColor = Color.fromRGBO(153, 153, 153, 0.1);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(14, 45, 14, 19),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 66,
                        height: 66,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    Constant.ASSETS_IMG + 'logo.jpg'),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(33))),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ClauseYi-2020-copy-right放到沙发空间立刻风口浪尖的时刻了',
                              style: TextStyle(
                                color: Color.fromRGBO(80, 80, 80, 1),
                                fontSize: 18,
                                height: 1.8,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "1997年加入，我要好好学习天天向上~东方的风景画家奋斗史",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Color.fromRGBO(166, 166, 166, 1),
                                fontSize: 13,
                                height: 2.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 56,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Center(
                            child: Text(
                              '我的订阅',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(80, 80, 80, 1),
                              ),
                            ),
                          ),
                          onTap: () => {print('我的订阅')},
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 22,
                        color: _bgColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Center(
                            child: Text(
                              '我的收藏',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(80, 80, 80, 1),
                              ),
                            ),
                          ),
                          onTap: () => {print('我的订阅')},
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 22,
                        color: _bgColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Center(
                            child: Text(
                              '我的下载',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(80, 80, 80, 1),
                              ),
                            ),
                          ),
                          onTap: () => {print('我的下载')},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: _bgColor,
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              child: TextLineHeight(
              '附近的反倒是加分的考生拉法基第三方接口家里多大合适的数据库的空间的撒大苏打的尽快发大厦是对方可怜见可'
                '怜见范德萨发你的犯得上看见风口浪尖',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
