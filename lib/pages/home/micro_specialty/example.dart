import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import 'package:netease_cloud_classroom/widgets/videos_player/index.dart';
import './type.dart';

class Example extends StatelessWidget {
  final List<ExampleType> data = [
    ExampleType(title: '深度学习工程师', poster: '16', url: 'https://vodm0pihssv.vod.126.net/edu-video/nos/mp4/2017/01/09/1005673062_ba21d9a8f23445848b572b99963433ce_sd.mp4?ak=7909bff134372bffca53cdc2c17adc27a4c38c6336120510aea1ae1790819de87c84ac0e62bd4249e5289adcd5c688e882e569aff7c0421bc25343cd7a6b37ed22117d840132767793f969aceceae379b45e295904aad63b2b64dea620b0aaeb4426afeac364f76a817da3b2623cd41e'),
    ExampleType(title: '地产数据分析师', poster: '17', url: 'https://vodm0pihssv.vod.126.net/edu-video/nos/mp4/2017/09/14/1007086181_92c7e8745de0420899524b932aabb94d_sd.mp4?ak=7909bff134372bffca53cdc2c17adc27a4c38c6336120510aea1ae1790819de87c84ac0e62bd4249e5289adcd5c688e8e6c3dc711f4e6ed86048fdfd8754aeeb22117d840132767793f969aceceae3790e721008d35c3a6c59a839595ca47c13623591d5e74d0640a136e4a4f0e4eb71'),
  ];
  Widget generateListItem(ExampleType item) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                Constant.ASSETS_IMG + 'temp/post${item.poster}.jpg',
                height: 96,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                left: 10,
                child: Row(children: <Widget>[
                  Icon(Icons.play_circle_outline, size: 16,color: Colors.white,),
                  SizedBox(width: 1,),
                  Text('观看视频', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],),
              ),
            ],
          ),
          Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontSize: 13,
                height: 1.7),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 13);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 9),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          generateListItem(data[0]),
          SizedBox(
            width: 9,
          ),
          generateListItem(data[1]),
        ],
      ),
    );
  }
}
