import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/util/screen_utils.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import 'package:netease_cloud_classroom/widgets/count_down_widget.dart';

class Ads extends StatefulWidget {
  Ads({Key key, @required this.onHide})
      : assert(onHide != null),
        super(key: key);
  final onHide;
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // width: ScreenUtils.screenW(context),
      // height: ScreenUtils.screenH(context),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: ScreenUtils.screenW(context) / 3,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(Constant.ASSETS_IMG + 'logo.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    '落花有意随流水，流水无心恋落花',
                    style: TextStyle(fontSize: 15.0, color: Colors.purple),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment(1.0, 0.0),
                  child: Container(
                    margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: CountDownWidget(
                      onCountDownFinished: widget.onHide,
                      value: 3,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        Constant.ASSETS_IMG + 'logo1.webp',
                        width: ScreenUtils.screenW(context) / 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Copyright© 1970-2021 ClauseYi.All Right Reserved.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
