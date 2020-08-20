import 'package:flutter/widgets.dart';

class TextLineHeight extends StatelessWidget {
  TextLineHeight(
    this.text, {
    Key key,
  })  : assert(text != null),
        super(key: key);
  final String text;

  final double leading = 0;
  final double textLineHeight = 2;
  final double fontSize = 12;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: Color.fromRGBO(240, 141, 73, 1),
        fontSize: fontSize,
        height: textLineHeight,
      ),
      strutStyle: StrutStyle(fontSize: fontSize, leading: 0.5 * textLineHeight),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: false),
    );
  }
}
