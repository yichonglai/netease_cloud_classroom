import 'package:flutter/material.dart';
import './hot_panel.dart';
import './list_panel.dart';
import './theme_list_panel.dart';
import './theme_single_panel.dart';

class Individual extends StatefulWidget {
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scrollbar(
      child: ListView(
        children: <Widget>[
          HotPanel(),
          ListPanel(),
          ThemeListPanel(),
          ThemeSinglePanel(),
        ],
      ),
    );
  }
}
