import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import './type.dart';

class Example extends StatelessWidget {
  final List<ExampleType> data = [
    ExampleType(title: '深度学习工程师', image: '16'),
    ExampleType(title: '地产数据分析师', image: '17'),
  ];
  Widget generateListItem(ExampleType item) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                Constant.ASSETS_IMG + 'temp/post${item.image}.jpg',
                height: 96,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                left: 10,
                child: Row(children: <Widget>[
                  Icon(Icons.play_circle_outline, size: 16,color: Colors.white,),
                  SizedBox(width: 1,),
                  Text('观看视频', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],),
              ),
            ],
          ),
          Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontSize: 13,
                height: 1.7),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 13);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 9),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          generateListItem(data[0]),
          SizedBox(
            width: 9,
          ),
          generateListItem(data[1]),
        ],
      ),
    );
  }
}
