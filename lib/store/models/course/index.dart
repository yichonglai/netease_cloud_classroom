import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import './type.dart';

class CourseModel with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isFetching = false;
  Result _data;

  bool get isFetching => _isFetching;
  Result get data => _data;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();
    Response res = await Dio().post(
      'https://m.study.163.com/j/operation/homepage.json',
      options: Options(responseType: ResponseType.plain),
    ).catchError(() => null);
    _isFetching = false;
    if (res?.statusCode == 200) {
      final tempData = welcomeFromJson(res.data.toString());
      _data = tempData.result;
    }
    notifyListeners();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(FlagProperty('isFetching', value: true, showName: true));
  }
}
