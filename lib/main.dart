import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import 'package:kkt/app_model.dart';
import 'package:kkt/routes/Routes.dart';
import 'package:kkt/utils/provider.dart';
import 'package:kkt/utils/shared_preferences.dart';
import 'package:kkt/localizations/DemoLocalizationsDelegate.dart';

SpUtil sp;
var db;
GetIt getIt = GetIt.instance;

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
  getIt.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Access the instance of the registered AppModel
    // As we don't know for sure if AppModel is already ready we use getAsync
    getIt
        .isReady<AppModel>()
        .then((_) => getIt<AppModel>().addListener(update));
    // Alternative
    // getIt.get<AppModel>().addListener(update);
    super.initState();
    _initFluwx();
  }

  @override
  void dispose() {
    getIt<AppModel>().removeListener(update);
    super.dispose();
  }

  update() => setState(() => {});

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
            title: new Text('确定吗?'),
            content: new Text('是否退出应用'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('否'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('是'),
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
      child: FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false, // 去掉debug图标
              initialRoute: '/', // 初始化的时候加载的路由
              onGenerateRoute: onGenerateRoute,
              localizationsDelegates: [
                // ... app-specific localization delegate[s] here
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DemoLocalizationsDelegate.delegate, //添加在此处
              ],
              supportedLocales: [
                const Locale('zh', 'CH'),
                const Locale('en', 'US'), // English
                // ... other locales the app supports
              ],
              theme: new ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.blue,
                accentColor: Colors.cyan[600],
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '等待初始化.....',
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 16,
                ),
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}
