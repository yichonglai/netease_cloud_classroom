import 'package:flutter/material.dart';
import '../../widgets/search_input.dart';
import './individual/index.dart';
import './course/index.dart';
import './micro_specialty/index.dart';
import 'package:netease_cloud_classroom/router.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List tabs = const ["个性推荐", "课堂", "微专业"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(236, 238, 241, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  SearchInput(
                    hintText: '网易云课堂',
                    margin: EdgeInsets.fromLTRB(
                        14, 0, 14, 0),
                    disabled: true,
                    onTab: (){
                      print('------------======================');
                      Navigator.pushNamed(context, Router.searchPage);
                    },
                  ),
                  TabBar(
                    indicatorWeight: 2.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Color.fromRGBO(51, 177, 123, 1),
                    labelColor: Color.fromRGBO(51, 177, 123, 1),
                    labelStyle: TextStyle(fontSize: 14),
                    unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
                    tabs: tabs.map((t) {
                      return Tab(
                        child: Text(t),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Individual(),
            Course(),
            MicroSpecialty(),
          ],
        ),
      ),
    );
  }
}
