import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'package:netease_cloud_classroom/pages/home/course/type.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:netease_cloud_classroom/router.dart';
import 'package:netease_cloud_classroom/type.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import './type.dart';
import './course_panel.dart';
import './course_list.dart';

const _COLOR_THEME = const Color.fromRGBO(51, 177, 123, 1);

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Result data;
  bool isLoading = false;
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: ThemeData(primaryColor: _COLOR_THEME),
      child: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: fetchData,
        child: CustomScrollView(
          slivers: <Widget>[
            (data?.focusDtoList != null && data?.focusDtoList?.length != 0) ? SliverToBoxAdapter(
              child: SizedBox(
                height: 137,
                child: Swiper(
                  itemHeight: 137,
                  itemCount: data.focusDtoList.length,
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
                        final BrowserParamsType params = BrowserParamsType(
                            url: data.focusDtoList[idx].targetTo,
                            title: data.focusDtoList[idx].name);
                        Navigator.pushNamed(
                            context, Router.browser, arguments: params);
                      },
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: data.focusDtoList[idx].photoUrl,
                        height: 137,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ) : SliverToBoxAdapter(child: SizedBox()),
            data?.iconDtoList != null ? SliverToBoxAdapter(
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
                    ...data.iconDtoList
                        .map((item) =>
                        Column(
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
            ) : SliverToBoxAdapter(child: SizedBox()),
            ...(data?.sectionDtoList ?? [])
                .map((item) =>
                CoursePanel(
                  title: item.sectionName,
                  child: CourseList(
                    listType: item.sectionTemplate,
                    data: item.elementDtoList,
                  ),
                ))
                .toList(),
          ],
        ),
      ),
    );
  }

  void fetchData() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    try {
      Response res = await Dio().post(
          'https://m.study.163.com/j/operation/homepage.json',
          options: Options(responseType: ResponseType.plain));
      if (!mounted) return;
      setState(() {
        isLoading = false;
        final tempData = welcomeFromJson(res.data.toString());
        data = tempData.result;
      });
      _refreshController.refreshCompleted();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _refreshController.refreshFailed();
      print('ERROR-$e');
    }
  }
}
