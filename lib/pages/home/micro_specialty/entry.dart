import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import 'package:netease_cloud_classroom/router.dart';
import 'package:netease_cloud_classroom/type.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 394,
          // TODO：怎么调整图片饱和度、亮度等
          child: Image.asset(
            Constant.ASSETS_IMG + 'temp/post15.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 57,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Align(
                        child: Text(
                          'S',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      width: 39,
                      height: 39,
                      margin: EdgeInsets.only(right: 5, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                    ),
                    Text(
                      '微专业',
                      style: TextStyle(color: Colors.white, fontSize: 34),
                    ),
                  ],
                ),
                Text(
                  'SPECIALIZATION',
                  style: TextStyle(fontSize: 17, color: Colors.white60),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  child: Text(
                    '跟随知名企业的一线资深工程师、设计师，\n'
                    '以及行业知名专家学习，\n'
                    '系统的掌握工作方法和技巧，获得全面的职业提升！',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Router.browser,
                        arguments: BrowserParamsType(
                            url: 'https://m.study.163.com/smartSpec/intro.htm'),
                      );
                    },
                    color: Color.fromRGBO(54, 133, 198, 1),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '查看所有微专业',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
