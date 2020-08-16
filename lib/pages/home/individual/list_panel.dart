import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';

class ListType {
  ListType({this.title, this.subTitle, this.image});
  final String title;
  final String subTitle;
  final String image;
}

class ListPanel extends StatelessWidget {
  final List<ListType> data = [
    ListType(
      title: '人家设计这个才叫loading，你设计的那个顶多叫菊花',
      subTitle: '等待界面的设计最初的时候并不走心，现在已经花样百出，本文带你一起看看。',
      image: '1',
    ),
    ListType(
      title: '一套独特风格的iOS UI模板，PSD源文件免费分享',
      subTitle: '之前很多人跟我提过说，问我，能不能分享些UI方面的内容，我说，当然可以',
      image: '2',
    ),
    ListType(
      title: '绘画就是欺骗——埃舍尔的艺术与科学',
      subTitle: 'M.C.埃舍尔，荷兰科学思维版画大师，20世纪画坛中独树一帜的艺术家。',
      image: '3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ...data.map(
            (item) => Container(
              padding: EdgeInsets.fromLTRB(9, 17, 14, 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color.fromRGBO(80, 80, 80, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.subTitle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  fontSize: 12,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Image.asset(
                        Constant.ASSETS_IMG + 'temp/post${item.image}.png',
                        width: 94,
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(236, 238, 241, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
