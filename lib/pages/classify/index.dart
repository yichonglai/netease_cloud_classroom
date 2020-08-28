//import 'package:flutter/material.dart';
//import 'package:netease_cloud_classroom/widgets/videos_player/index.dart';
//
//class Classify extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//        child: Text('2122'),
//      ),
//    );
//  }
//}

import 'package:netease_cloud_classroom/widgets/videos_player/index.dart';
import 'package:netease_cloud_classroom/widgets/videos_player/player.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Classify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  YepController _yepController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network("https://jdvodluwytr3t.vod.126.net/jdvodluwytr3t/nos/mp4/2019/08/19/1214982311_54311dbb34344230aaab21902857cb86_sd.mp4?ak=7909bff134372bffca53cdc2c17adc27a4c38c6336120510aea1ae1790819de839c2714eca141c5a039e6a78861fddbff680e14c8f39aaf7f513dffebf00f4a722117d840132767793f969aceceae379f38a6652b21b075b5a0460a5a94e4876623591d5e74d0640a136e4a4f0e4eb71");
    _videoPlayerController2 = VideoPlayerController.network('http://mpvideo.qpic.cn/0b78vmaagaaavianwojzbjpvbk6daovqaaya.f10002.mp4?dis_k=3cf4b4ed07e1f1a6b498784932b7149b&dis_t=1598501478');
    _yepController = YepController(
      videoPlayerController: _videoPlayerController1,
//      aspectRatio: 4 / 3,
      autoPlay: true,
      looping: true,
      // Try playing around with some of   other options:

      // showControls: false,
      // materialProgressColors: VideosPlayerProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
       placeholder: Container(
         color: Colors.grey,
       ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _yepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Yep(
                controller: _yepController,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              _yepController.enterFullScreen();
            },
            child: Text('Fullscreen'),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _yepController.dispose();
                      _videoPlayerController2.pause();
                      _videoPlayerController2.seekTo(Duration(seconds: 0));
                      _yepController = YepController(
                        videoPlayerController: _videoPlayerController1,
                        aspectRatio: 3 / 2,
                        autoPlay: true,
                        looping: true,
                      );
                    });
                  },
                  child: Padding(
                    child: Text("Video 1"),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _yepController.dispose();
                      _videoPlayerController1.pause();
                      _videoPlayerController1.seekTo(Duration(seconds: 0));
                      _yepController = YepController(
                        videoPlayerController: _videoPlayerController2,
                        aspectRatio: 3 / 2,
                        autoPlay: true,
                        looping: true,
                      );
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Error Video"),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _platform = TargetPlatform.android;
                    });
                  },
                  child: Padding(
                    child: Text("Android controls"),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _platform = TargetPlatform.iOS;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("iOS controls"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
