import 'dart:ui';

import './player.dart';
import './cupertino_controls.dart';
import './material_controls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWithControls extends StatelessWidget {
  PlayerWithControls({Key key, this.title = '',}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final YepController yepController = YepController.of(context);

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio:
              yepController.aspectRatio ?? _calculateAspectRatio(context),
          child: _buildPlayerWithControls(yepController, context),
        ),
      ),
    );
  }

  Container _buildPlayerWithControls(
      YepController yepController, BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          yepController.placeholder ?? Container(),
          Center(
            child: AspectRatio(
              aspectRatio: yepController.aspectRatio ??
                  _calculateAspectRatio(context),
              child: VideoPlayer(yepController.videoPlayerController),
            ),
          ),
          yepController.overlay ?? Container(),
          _buildControls(context, yepController),
        ],
      ),
    );
  }

  Widget _buildControls(
    BuildContext context,
    YepController yepController,
  ) {
    return yepController.showControls
        ? yepController.customControls != null
            ? yepController.customControls
            : Theme.of(context).platform == TargetPlatform.android
                ? MaterialControls(title: title,)
                : CupertinoControls(
                    backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
                    iconColor: Color.fromARGB(255, 200, 200, 200),
                  )
        : Container();
  }

  double _calculateAspectRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return width > height ? width / height : height / width;
  }
}
