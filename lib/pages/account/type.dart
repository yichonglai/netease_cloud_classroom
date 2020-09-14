import 'package:flutter/material.dart';

class ListType {
  ListType({this.title = '', this.icon, this.onTab, this.underline = false, this.desc, this.marginTop = 0}): assert(icon != null);
  final String title;
  final IconData icon;
  final VoidCallback onTab;
  final String desc;
  final bool underline;
  final double marginTop;
}