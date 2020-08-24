import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import './type.dart';

class Tutor extends StatelessWidget {
  final List<TutorType> data = [
    TutorType(
        name: '吴恩达 Andrew Ng',
        avatar: '1',
        desc: 'deeplearning.ai 创始人',
        organize: '1'),
    TutorType(name: '翁恺', avatar: '2', desc: '浙江大学计算机学院教师', organize: '2'),
    TutorType(name: '阮良', avatar: '3', desc: '网易高级总监', organize: '3'),
    TutorType(name: '罗仕鉴', avatar: '4', desc: '浙江大学工业设计系教授', organize: '2'),
    TutorType(name: '钱蓓蕾', avatar: '5', desc: '网易测试总监', organize: '3'),
    TutorType(
        name: 'Howard Ward', avatar: '6', desc: '中欧国际工商学院管理学教授', organize: '4'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            heightFactor: 2.9,
            child: Text(
              '微专业导师简介',
              style:
                  TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 16),
            ),
          ),
          Wrap(
            children: generateTutorList(data),
          ),
        ],
      ),
    );
  }

  List<Widget> generateTutorList(List<TutorType> list) {
    List<Widget> tempList = [];
    for (var i = 0; i < list.length; i++) {
      final currentItem = list[i];
      tempList.add(
        FractionallySizedBox(
          widthFactor: 0.5,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 19),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 56,
                      height: 56,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromRGBO(236, 238, 241, 1),
                          width: 1,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Constant.ASSETS_IMG +
                            'temp/avatar${currentItem.avatar}.jpg'),
                      ),
                    ),
                    Center(
                        heightFactor: 1.75,
                        child: Text(
                          currentItem.name,
                          style: TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    Center(
                        heightFactor: 1.75,
                        child: Text(
                          currentItem.desc,
                          style: TextStyle(
                              color: Color.fromRGBO(128, 128, 128, 1),
                              fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      Constant.ASSETS_IMG +
                          'temp/logo${currentItem.organize}.png',
                      height: 28,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  color: i % 2 == 0
                      ? Color.fromRGBO(236, 238, 241, 1)
                      : Colors.transparent,
                  width: 1,
                ),
                top: 16,
                bottom: 16,
                right: -0.5,
              ),
              Positioned(
                child: Container(
                  color: i > 1
                      ? Color.fromRGBO(236, 238, 241, 1)
                      : Colors.transparent,
                  height: 1,
                ),
                top: -0.5,
                left: 19,
                right: 19,
              ),
            ],
          ),
        ),
      );
    }
    return tempList;
  }
}
