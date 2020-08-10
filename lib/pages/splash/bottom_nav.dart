import 'package:flutter/material.dart';
import '../home/index.dart';
import '../classify/index.dart';
import '../myStudy/index.dart';
import '../account/index.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [Home(), Classify(), MyStudy(), Account()];
  final List<BottomNavigationBarItem> _navs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Color.fromRGBO(166, 166, 166, 1),
      ),
      activeIcon: Icon(
        Icons.home,
        color: Color.fromRGBO(60, 74, 84, 1),
      ),
      title: Text(
        '首页',
        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1)),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.subject,
        color: Color.fromRGBO(166, 166, 166, 1),
      ),
      activeIcon: Icon(
        Icons.subject,
        color: Color.fromRGBO(60, 74, 84, 1),
      ),
      title: Text(
        '分类',
        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1)),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.local_library,
        color: Color.fromRGBO(166, 166, 166, 1),
      ),
      activeIcon: Icon(
        Icons.local_library,
        color: Color.fromRGBO(60, 74, 84, 1),
      ),
      title: Text(
        '我的学习',
        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1)),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: Color.fromRGBO(166, 166, 166, 1),
      ),
      activeIcon: Icon(
        Icons.person,
        color: Color.fromRGBO(60, 74, 84, 1),
      ),
      title: Text(
        '账号',
        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1)),
      ),
    ),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _navs,
      ),
      body: Container(
          // padding: EdgeInsets.only(top: 24.0),
          // alignment: Alignment(0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _pages[_currentIndex]),
    );
  }
}
