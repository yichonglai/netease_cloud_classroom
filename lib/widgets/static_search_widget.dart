import 'package:flutter/material.dart';

class StaticSearchWidget extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;
  StaticSearchWidget(
      {Key key, this.hintText, this.onSubmitted, this.onTab, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      width: MediaQuery.of(context).size.width,
      height: 33.0,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 244, 248, 1),
        borderRadius: BorderRadius.circular(17.0),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 80, 80, 80),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: -3, right: 15),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12, color: Color.fromARGB(255, 192, 191, 191)),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  getContainer(BuildContext context, ValueChanged<String> onSubmitted) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      height: 40.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 237),
          borderRadius: BorderRadius.circular(24.0)),
      child: TextField(
        onSubmitted: onSubmitted,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20),
            prefixIcon: Icon(
              Icons.search,
              size: 29,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
