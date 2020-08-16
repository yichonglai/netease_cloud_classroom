import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';

class ThemeSinglePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(Constant.ASSETS_IMG + 'temp/post8.png'),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1.5,
            child: Text(
              '汤小元的手绘POP插画完整详解',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1.5,
            child: Text(
              '汤小元 共54个课时',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            '分别从字体、构图和技法三方面完整介绍手绘POP插画的绘制方法。放火烧山的反馈大家快乐',
            style: TextStyle(
              color: Color.fromRGBO(160, 160, 160, 1),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
