import 'package:flutter/material.dart';
import './item.dart';
import './type.dart';
import 'item.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      color: Color.fromRGBO(153, 153, 153, 0.1),
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            title: Text('账号'),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('账号'),
              background: Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          ...list.map((e) => Item(
            title: e.title,
            icon: e.icon,
            onTab: e.onTab,
            desc: e.desc,
            underline: e.underline,
            marginTop: e.marginTop,
          )).toList(),
        ],
      ),
    );
  }
  final List<ListType> list = [
    ListType(title: '消息中心', icon: Icons.mail_outline, marginTop: 5),
    ListType(title: '个人资料', icon: Icons.person_outline, marginTop: 10, underline: true),
    ListType(title: '学习兴趣', icon: Icons.school),
    ListType(title: '我的余额', icon: Icons.monetization_on, marginTop: 10, underline: true),
    ListType(title: '我的订单', icon: Icons.fiber_dvr),
    ListType(title: '设置', icon: Icons.settings, marginTop: 10),
    ListType(title: '意见反馈', icon: Icons.message, marginTop: 10, underline: true),
    ListType(title: '给网易云课堂评价', icon: Icons.edit),
  ];
}
