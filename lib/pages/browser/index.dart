import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//onPressed: () {
//Navigator.of(context)
//    .push(new MaterialPageRoute(builder: (_) {
//return new Browser(
//url: "https://flutter-io.cn/",
//title: "Flutter 中文社区",
//);
//}));
//}
class Browser extends StatelessWidget {
  Browser({Key key, this.title, this.url}) : super(key: key);
  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
