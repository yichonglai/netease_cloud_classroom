import 'package:flutter/material.dart';
import './type.dart';
import '../home/index.dart';
import '../category/index.dart';
import '../myStudy/index.dart';
import '../account/index.dart';
import 'package:netease_cloud_classroom/http/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_classroom/router.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [Home(), Category(), MyStudy(), Account()];
  final List<BottomNavType> _list = [
    BottomNavType(title: '首页', icon: Icons.home),
    BottomNavType(title: '分类', icon: Icons.subject),
    BottomNavType(title: '我的学习', icon: Icons.local_library),
    BottomNavType(title: '账号', icon: Icons.person),
  ];

  void onTabTapped(int index) async {
    try {
      if (index > 1) {
        // 判断是否登录
        await Http().post(url: '/user/getUserInfo', data: {"token": "yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6Im1pbGlfaGUiLCJ1c2VySWQiOjQsImlhdCI6MTYwNTk0NDM5NywiZXhwIjoxNjA2MDMwNzk3fQ.leE-4xv9fgplj_BimImiEhaVeGWqVNRx6-6i5hReJms"});
      }
      setState(() {
        _currentIndex = index;
      });
    } catch (e) {
      // 未登录
      if (e.code == 'FAIL_USER_NO_LOGIN') {
        Navigator.pushNamed(context, Router.login);
      } else {
        Fluttertoast.showToast(
          msg: e.message,
          gravity: ToastGravity.CENTER,
          textColor: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _list
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(
                    item.icon,
                    color: Color.fromRGBO(166, 166, 166, 1),
                  ),
                  activeIcon: Icon(
                    item.icon,
                    color: Color.fromRGBO(60, 74, 84, 1),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1)),
                  ),
                ))
            .toList(),
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
