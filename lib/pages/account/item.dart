import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({Key key, this.title, this.icon, this.onTab, this.underline = false})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTab;
  final bool underline;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(12, 11, 9, 0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 11),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        icon,
                        size: 23,
                        color: Color.fromRGBO(153, 164, 189, 1),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(80, 80, 80, 1)),
                      ),
                    ),
                    _rightArrow()
                  ],
                ),
              ),
              Offstage(
                offstage: !underline,
                child: Container(
                  height: 1,
                  color: Color.fromRGBO(153, 153, 153, 0.1),
                ),
              ),
            ],
          ),
          onTap: onTab,
        ),
      ),
    );
  }
}

_rightArrow() => Icon(
      Icons.chevron_right,
      color: Color.fromARGB(255, 166, 166, 166),
    );
