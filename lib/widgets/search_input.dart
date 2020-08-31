import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;
  final bool disabled;
  SearchInput(
      {Key key,
      this.hintText,
      this.onSubmitted,
      this.onTab,
      this.margin,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      height: 33.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 33.0,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 244, 248, 1),
                borderRadius: BorderRadius.circular(16.5),
              ),
              child: InkWell(
                onTap: onTab,
                child: TextField(
                  enabled: !disabled,
                  autofocus: true,
                  onSubmitted: onSubmitted,
                  cursorColor: Color.fromARGB(255, 80, 80, 80),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: -3, right: 15),
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 192, 191, 191)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          !disabled ?
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              child: Align(
                alignment: Alignment.centerRight,
                heightFactor: 2,
                child: Text(
                  '取消',
                  style: TextStyle(
                      color: Color.fromRGBO(80, 80, 80, 1),
                      fontSize: 14,
                      height: 1),
                ),
              ),
              onTap: () {Navigator.of(context).pop();},
            ),
          ) : Padding(padding: EdgeInsets.all(0))
        ],
      ),
    );
  }
}
