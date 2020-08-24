import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:transparent_image/transparent_image.dart';
import './type.dart';

class CourseList extends StatelessWidget {
  CourseList({Key key, this.listType, this.data})
      : assert(listType != null),
        assert(data != null),
        super(key: key);
  final String listType;
  final List<DtoList> data;
  @override
  Widget build(BuildContext context) {
    if (listType == 'A_A_A') {
      return Column(
        children: <Widget>[
          ...data
              .map((item) => Padding(
                    padding:
                        EdgeInsets.only(top: data[0].name == item.name ? 0 : 5),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item.photoUrl,
                    ),
                  ))
              .toList(),
        ],
      );
    } else if (listType == 'A_BB_BB') {
      return Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: <Widget>[
          ...data
              .map(
                (item) => FractionallySizedBox(
                  widthFactor: data[0].name == item.name ? 1 : 0.49,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: data[0].name == item.name ? 0 : 10,
                      ),
                      data[0].name == item.name
                          ? FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: item.photoUrl,
                              fit: BoxFit.fitWidth,
                            )
                          : FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: item.photoUrl,
                              height: 94,
                              fit: BoxFit.fitWidth,
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          fontSize: 13,
                          height: 1.5,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                              allowHalfRating: true,
                              starCount: 5,
                              rating: 3 * item.weight / 3,
                              size: 11.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              color: Color.fromRGBO(51, 177, 123, 1),
                              borderColor: Color.fromRGBO(51, 177, 123, 1),
                              spacing: 0.0),
                          Text(
                            '${item.weight}',
                            style: TextStyle(
                              color: Color.fromRGBO(80, 80, 80, 1),
                              fontSize: 11,
                            ),
                          ),
                          Expanded(
                              child: Text(
                            '666人学过',
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
                        item.courseCardVo != null
                            ? '¥ ${item.courseCardVo.yktCourseCardv.price}'
                            : '免费',
                        style: TextStyle(
                          fontSize: 13,
                          color: item.courseCardVo != null
                              ? Color.fromRGBO(238, 104, 72, 1)
                              : Color.fromRGBO(51, 177, 123, 1),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int idx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: data[idx].photoUrl,
              height: 94,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                data[idx].name,
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
                    rating: 3 * data[idx].weight / 3,
                    size: 11.0,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    color: Color.fromRGBO(51, 177, 123, 1),
                    borderColor: Color.fromRGBO(51, 177, 123, 1),
                    spacing: 0.0),
                Text(
                  '${data[idx].weight}',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 80, 80, 1),
                    fontSize: 11,
                  ),
                ),
                Expanded(
                    child: Text(
                  '666人学过',
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
              data[idx].courseCardVo != null
                  ? '¥ ${data[idx].courseCardVo.yktCourseCardv.price}'
                  : '免费',
              style: TextStyle(
                fontSize: 13,
                color: data[idx].courseCardVo != null
                    ? Color.fromRGBO(238, 104, 72, 1)
                    : Color.fromRGBO(51, 177, 123, 1),
                height: 1.5,
              ),
            ),
          ],
        );
      },
    );
  }
}
