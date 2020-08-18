import 'package:flutter/material.dart';

class CoursePanel extends StatelessWidget {
  CoursePanel({Key key, this.title, this.child})
      : assert(title != null),
        assert(child != null),
        super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 9),
        margin: EdgeInsets.only(top: 12),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Align(
              heightFactor: 1.8,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromRGBO(80, 80, 80, 1),
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ),
//            Wrap(
//              children: <Widget>[],
//            ),
          ],
        ),
      ),
    );
  }
}
