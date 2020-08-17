import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/constant/index.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ThemeListPanel extends StatelessWidget {
  final List<ListType> data = [
    ListType(
      title: '简笔画核心技巧&主题训练（图文）',
      peopleCount: 1097,
      price: 30.00,
      image: '4',
      star: 4.6,
    ),
    ListType(
      title: '静物素描结构【凡路教育】创新美术绘画',
      peopleCount: 8340,
      price: '免费',
      image: '5',
      star: 4.3,
    ),
    ListType(
      title: '怎样用PS绘画素描头像',
      peopleCount: 7622,
      price: '免费',
      image: '6',
      star: 3.5,
    ),
    ListType(
      title: '【田工头插画原画教程】绘画基础',
      peopleCount: 666,
      price: '免费',
      image: '7',
      star: 2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 11, 0, 14),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 9,
              bottom: 15,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.import_contacts,
                  color: Color.fromRGBO(71, 134, 217, 1),
                  size: 23,
                ),
                Expanded(
                  child: Text(
                    '“绘画”值得学的课',
                    style: TextStyle(
                      color: Color.fromRGBO(80, 80, 80, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {print('更多～～～')},
                  child: Row(
                    children: <Widget>[
                      Text(
                        '更多',
                        style: TextStyle(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromRGBO(80, 80, 80, 1),
                        size: 23,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 173,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemExtent: 176,
              itemBuilder: (BuildContext context, int idx) {
                print(idx);
                return Container(
                  margin: EdgeInsets.only(
                      left: idx == 0 ? 9 : 0,
                      right: idx == data.length - 1 ? 9 : 13),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        Constant.ASSETS_IMG + 'temp/post${data[idx].image}.jpg',
                        height: 74,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          data[idx].title,
                          style: TextStyle(
                            color: Color.fromRGBO(80, 80, 80, 1),
                            fontSize: 13,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: data[idx].star,
                              size: 11.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              color: Color.fromRGBO(51, 177, 123, 1),
                              borderColor: Color.fromRGBO(51, 177, 123, 1),
                              spacing: 0.0),
                          Text(
                            '${data[idx].star}',
                            style: TextStyle(
                              color: Color.fromRGBO(80, 80, 80, 1),
                              fontSize: 11,
                            ),
                          ),
                          Expanded(
                              child: Text(
                            '${data[idx].peopleCount}人学过',
                            style: TextStyle(
                              color: Color.fromRGBO(80, 80, 80, 1),
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.right,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data[idx].price is num ? '¥ ${data[idx].price}' : '免费',
                        style: TextStyle(
                          fontSize: 13,
                          color: data[idx].price is num
                              ? Color.fromRGBO(238, 104, 72, 1)
                              : Color.fromRGBO(51, 177, 123, 1),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListType {
  ListType({this.title, this.peopleCount, this.price, this.image, this.star});
  final String title;
  final int peopleCount;
  final String image;
  var price;
  final double star;
}
