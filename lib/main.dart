
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug图标
      initialRoute: '/', //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan[600],
      ),
    );
  }
}
