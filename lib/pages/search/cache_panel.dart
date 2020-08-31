import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachePanel extends StatelessWidget {
  final String title;
  final VoidCallback onCancel;
  final List<String> data;
  CachePanel(
      {Key key, this.title, this.onCancel, this.data = const []})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color fontColor = const Color.fromRGBO(80, 80, 80, 1);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                heightFactor: 1.6,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14, color: fontColor, height: 1),
                ),
              ),
              Offstage(
                offstage: onCancel == null ? true : false,
                child: InkWell(
                  onTap: onCancel,
                  child: Text(
                    '清除记录',
                    style: TextStyle(fontSize: 13, color: fontColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Wrap(children: generateList(data)),
        ],
      ),
    );
  }

  List<Widget> generateList(List<String> list) {
    return list
        .map(
          (e) => Container(
            margin: EdgeInsets.only(right: 7, bottom: 10),
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1, color: Color.fromRGBO(153, 164, 189, 1))),
                child: Text(
                  e,
                  style: TextStyle(
                      color: Color.fromRGBO(153, 164, 189, 1),
                      fontSize: 13,
                      height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
