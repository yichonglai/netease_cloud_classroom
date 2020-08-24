import 'package:flutter/material.dart';

class Major extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(54, 133, 198, 1),
      child: Column(
        children: <Widget>[
          Center(
            heightFactor: 3.5,
            child: Text(
              '选择自己喜欢的职业',
              style:
              TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
//          Wrap(
//            children: generateMajorList(data),
//          ),
        ],
      ),
    );
  }
}
