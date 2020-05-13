import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'routes/Routes.dart';

import 'utils/provider.dart';
import 'utils/shared_preferences.dart';

SpUtil sp;
var db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final provider = new Provider();
  await provider.init(true);
  sp = await SpUtil.getInstance();
  db = Provider.db;
  // if (Platform.isAndroid) {
  //   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  //   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initFluwx();
  }

  _initFluwx() async {
    await registerWxApi(
        appId: "wxd930ea5d5a258f4f",
        doOnAndroid: true,
        doOnIOS: true,
        universalLink: "https://your.univerallink.com/link/");
    var result = await isWeChatInstalled;
    print("is installed $result");
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    DateTime lastTime;
    return WillPopScope(
      onWillPop: () async {
        if (lastTime == null ||
            DateTime.now().difference(lastTime) > Duration(seconds: 1)) {
          lastTime = DateTime.now();
          Fluttertoast.showToast(
              msg: "双击退出",
              gravity: ToastGravity.CENTER,
              textColor: Colors.grey);
          return false;
        }
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //去掉debug图标
        initialRoute: '/', //初始化的时候加载的路由
        onGenerateRoute: onGenerateRoute,
        theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.cyan[600],
        ),
      ),
    );
  }
}
