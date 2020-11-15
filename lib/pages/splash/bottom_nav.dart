import 'package:flutter/material.dart';
import './type.dart';
import '../home/index.dart';
import '../category/index.dart';
import '../myStudy/index.dart';
import '../account/index.dart';
import 'package:netease_cloud_classroom/http/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    Fluttertoast.showToast(
        msg: "Toast提示信息",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    final res =
        await Http().get(url: '/user/checkLoginStatus').catchError((e) => {
          print(e.message)
        });
    print('1=======');
    print(res);
//    setState(() {
//      _currentIndex = index;
//    });
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
