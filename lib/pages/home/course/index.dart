import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:netease_cloud_classroom/pages/home/course/type.dart';
import 'package:transparent_image/transparent_image.dart';
import './type.dart';
import './course_panel.dart';
import './course_list.dart';
import 'package:netease_cloud_classroom/pages/browser/index.dart';

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
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && data.result != null) {
      return Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 137,
                child: Swiper(
                  itemHeight: 137,
                  itemCount: data.result.focusDtoList.length,
                  autoplay: true,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      size: 6.0,
                      activeSize: 8.0,
                    ),
                  ),
                  itemBuilder: (BuildContext context, int idx) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(new MaterialPageRoute(builder: (_) {
                          return new Browser(
                            url: data.result.focusDtoList[idx].targetTo,
                            title: data.result.focusDtoList[idx].name,
                          );
                        }));
                      },
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: data.result.focusDtoList[idx].photoUrl,
                        height: 137,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 9),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 5.0,
                  children: <Widget>[
                    ...data.result.iconDtoList
                        .map((item) => Column(
                              children: <Widget>[
                                FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: item.photoUrl,
                                  width: 37.98,
                                  height: 37.98,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
            ...data.result.sectionDtoList
                .map((item) => CoursePanel(
                      title: item.sectionName,
                      child: CourseList(
                        listType: item.sectionTemplate,
                        data: item.elementDtoList,
                      ),
                    ))
                .toList(),
          ],
        ),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
