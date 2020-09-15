import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import './counter.dart';
import './models/course/index.dart';

class Store extends StatelessWidget {
  Store({Key key, this.child}): assert(child != null),super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => CourseModel()),
      ],
      child: child,
    );
  }
}

