import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease_cloud_classroom/constant/index.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> data = ['', '9'];
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SizedBox(
            height: 170,
            child: Swiper(
              itemCount: data.length,
              pagination: SwiperPagination(),
              control: SwiperControl(),
              itemBuilder: (BuildContext context, int idx) {
                return Image.asset(
                  Constant.ASSETS_IMG + 'temp/post${data[idx]}.png',
                  height: 170,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
