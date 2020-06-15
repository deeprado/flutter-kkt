import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

class BadgerPage extends StatefulWidget {
  BadgerPage({Key key}) : super(key: key);

  @override
  _BadgerPageState createState() => _BadgerPageState();
}

class _BadgerPageState extends State<BadgerPage> {
  String _appBadgeSupported = 'Unknown';

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _appBadgeSupported = appBadgeSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件示例'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Center(
              child: Text(_appBadgeSupported),
            ),
            new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('检查是否支持'),
              onPressed: () {
                FlutterAppBadger.isAppBadgeSupported();
              },
            ),
            new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('添加通知'),
              onPressed: () {
                FlutterAppBadger.updateBadgeCount(1);
              },
            ),
            new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('删除通知'),
              onPressed: () {
                FlutterAppBadger.removeBadge();
              },
            ),
          ],
        ),
      ),
    );
  }
}
