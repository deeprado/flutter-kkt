import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 客服

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var url =
      "https://chat.huolieyun.com/kuaizhiChat/MoblieChat_big.html?cid=PnqOzfb0&kuaizhi_style=16&fkID=a64f3fbd9332433a9fbe53327c6bfd20";

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    //
    return new WebviewScaffold(
      url: this.url,
      appBar: new AppBar(
        title: new Text("在线客服"),
      ),
    );
  }

  close() {
    flutterWebviewPlugin.close();
  }

  addListener() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
      // latest offset value in vertical scroll
      // compare vertical scroll changes here with old value
    });

    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
      // latest offset value in horizontal scroll
      // compare horizontal scroll changes here with old value
    });
  }
}
