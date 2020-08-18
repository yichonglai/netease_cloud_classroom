import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:netease_cloud_classroom/pages/home/course/type.dart';
import './type.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  Welcome data;
  void fetchData() async {
    try {
      Response res = await Dio().post(
          'https://m.study.163.com/j/operation/homepage.json',
          options: Options(responseType: ResponseType.plain));
      if (!mounted) return;
      setState(() {
        data = welcomeFromJson(res.data.toString());
      });
    } catch (e) {
      print('ERROR-$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 137,
              child: Swiper(
                itemHeight: 137,
                itemCount: data.result.focusDtoList.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int idx) {
                  return Image.network(
                    data.result.focusDtoList[idx].photoUrl,
                    height: 137,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: 250,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 9),
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.4,
                mainAxisSpacing: 5.0,
                children: <Widget>[
                  ...data.result.iconDtoList
                      .map((item) => Column(
                            children: <Widget>[
                              Image.network(
                                item.photoUrl,
                                width: 37,
                                height: 37,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Text('loading...');
    }
  }
}
