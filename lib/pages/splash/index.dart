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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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
    );
  }
}
