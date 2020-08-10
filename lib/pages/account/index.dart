import 'package:flutter/material.dart';
import './item.dart';

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
          _divider(5),
          Item(
            title: '消息中心',
            icon: Icons.mail_outline,
            onTab: () => {print('消息中心')},
          ),
          _divider(10),
          Item(
            title: '个人资料',
            icon: Icons.person_outline,
            underline: true,
          ),
          Item(title: '学习兴趣', icon: Icons.school),
          _divider(10),
          Item(
            title: '我的余额',
            icon: Icons.monetization_on,
            underline: true,
          ),
          Item(title: '我的订单', icon: Icons.fiber_dvr),
          _divider(10),
          Item(title: '设置', icon: Icons.settings),
          _divider(10),
          Item(
            title: '意见反馈',
            icon: Icons.message,
            underline: true,
          ),
          Item(title: '给网易云课堂评价', icon: Icons.edit),
        ],
      ),
    );
  }
}

SliverToBoxAdapter _divider(double height) => SliverToBoxAdapter(
      child: Divider(
        height: height,
        color: Colors.transparent,
      ),
    );
