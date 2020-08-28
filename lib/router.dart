import 'package:flutter/material.dart';
import './pages/splash/index.dart';
import './pages/browser/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Router.homePage: (BuildContext context) => Splash(),
  Router.browser: (BuildContext context) => Browser((ModalRoute.of(context).settings.arguments as dynamic).url, title: (ModalRoute.of(context).settings.arguments as dynamic).title,),
};
class Router {
  static const homePage = 'app://';
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