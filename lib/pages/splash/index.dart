import 'package:flutter/material.dart';
import '../ads/index.dart';
import './bottom_nav.dart';

///打开APP首页
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool showAd = true;
  DateTime lastPopTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Stack(
          children: <Widget>[
            Offstage(
              offstage: showAd,
              child: BottomNav(),
            ),
            Offstage(
              offstage: !showAd,
              child: Ads(onHide: (bool value) {
                if (value) {
                  setState(() {
                    showAd = false;
                  });
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 1)) {
      lastPopTime = DateTime.now();
      return false;
    }
    return true;
  }
}
