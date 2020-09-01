import 'package:flutter/material.dart';
const Color _BG_GREY_COLOR = const Color.fromRGBO(242, 244, 248, 1);
const Color _FONT_COLOR = const Color.fromRGBO(80, 80, 80, 1);

class LeftNav extends StatefulWidget {
  final List<String> navList;
  LeftNav({Key key, this.navList = const []}):super(key: key);
  @override
  _LeftNavState createState() => _LeftNavState();
}

class _LeftNavState extends State<LeftNav> {
  int _activeNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      margin: EdgeInsets.only(right: 0, top: 5),
      decoration: BoxDecoration(
        color: _BG_GREY_COLOR,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        itemCount: widget.navList.length,
        itemExtent: 50,
        padding: EdgeInsets.all(0),
        itemBuilder: (BuildContext context, int idx) {
          return InkWell(
            onTap: () {
              setState(() {
                _activeNavIndex = idx;
              });
            },
            child: Container(
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: _activeNavIndex == idx
                      ? Colors.white
                      : _BG_GREY_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(idx + 1 == _activeNavIndex ? 10 : 0),
                    topRight: Radius.circular(idx - 1 == _activeNavIndex || idx == 0 ? 10 : 0),
                  ),
                ),
                child: Text(
                  widget.navList[idx],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    color: _FONT_COLOR,
                    fontWeight: _activeNavIndex == idx
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
