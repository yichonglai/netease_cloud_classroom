import "package:flutter/material.dart";

// 这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
class RestartWidget extends StatefulWidget {
  RestartWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
