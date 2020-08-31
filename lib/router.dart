import 'package:flutter/material.dart';
import './type.dart';
import './pages/splash/index.dart';
import './pages/browser/index.dart';
import './pages/search/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Router.homePage: (BuildContext context) => Splash(),
  Router.searchPage: (BuildContext context) => Search(),
  Router.browser: (BuildContext context) {
    final BrowserParamsType params = ModalRoute.of(context).settings.arguments;
    return Browser(params.url, title:params.title);
  },
};
class Router {
  static const homePage = 'app://';
  static const searchPage = 'app://search';
  static const browser = 'app://browser';


//  Router.pushNoParams(BuildContext context, String url) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, null);
//    }));
//  }
//
//  Router.push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }
}