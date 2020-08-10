import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/widgets/static_search_widget.dart';
import '../../constant/index.dart';

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            child: Text(
                              'ClauseYi-2020-copy-right',
                              style: TextStyle(
                                color: Color.fromRGBO(80, 80, 80, 1),
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            "1997年加入，我要好好学习天天向上~",
                            style: TextStyle(
                              color: Color.fromRGBO(166, 166, 166, 1),
                              fontSize: 13,
                            ),
                          ),
                        ],
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
                        child: GestureDetector(
                          child: Text(
                            '我的订阅',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(80, 80, 80, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 22,
                        color: _bgColor,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            '我的收藏',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(80, 80, 80, 1),
                            ),
                          ),
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
                          onTap: () => {print('object')},
                          child: Text(
                            '我的下载',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(80, 80, 80, 1),
                            ),
                          ),
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
            child: Text('111'),
          ),
        ],
      ),
    );
  }
}
