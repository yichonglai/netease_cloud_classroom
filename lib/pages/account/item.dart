import 'package:flutter/material.dart';


class Item extends StatelessWidget {
  Item({Key key, this.title, this.icon, this.onTab, this.underline = false, this.desc = '', this.marginTop = 0})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTab;
  final String desc;
  final bool underline;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: onTab,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: marginTop),
          padding: EdgeInsets.fromLTRB(12, 11, 9, 0),
          child: Column(
            children: <Widget>[
              Row(
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
//                  Text(desc, style: TextStyle(),),
                  Icon(
                    Icons.chevron_right,
                    color: Color.fromARGB(255, 166, 166, 166),
                  )
                ],
              ),
              SizedBox(height: 11,),
              Offstage(
                offstage: !underline,
                child: Container(
                  height: 1,
                  color: Color.fromRGBO(153, 153, 153, 0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SliverToBoxAdapter divider(double height) => SliverToBoxAdapter(
  child: Divider(
    height: height,
    color: Colors.transparent,
  ),
);