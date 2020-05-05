import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kkt/app/OsApplication.dart';
import 'package:kkt/event/LoginEvent.dart';

import 'package:kkt/utils/WidgetsUtils.dart';
import 'package:kkt/utils/cache/SpUtils.dart';
import 'package:kkt/utils/net/Api.dart';
import 'package:kkt/utils/net/Http.dart';
import 'package:kkt/utils/toast/TsUtils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var leftRightPadding = 40.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "assets/images/login_logo.png";

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  WidgetsUtils widgetsUtils;

  @override
  Widget build(BuildContext context) {
    widgetsUtils = new WidgetsUtils(context);

    return Scaffold(
        appBar: new AppBar(
          title: widgetsUtils.getAppBar('登录'),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            new Container(
              child: new Image.asset(
                LOGO,
                fit: BoxFit.contain,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.fromLTRB(
                  leftRightPadding, 40.0, leftRightPadding, topBottomPadding),
              child: new TextField(
                style: hintTips,
                controller: _userNameController,
                decoration: new InputDecoration(
                    hintText: "请输入手机号", icon: Icon(Icons.ac_unit)),
                obscureText: false,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.fromLTRB(
                  leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
              child: new TextField(
                style: hintTips,
                controller: _userPassController,
                decoration: new InputDecoration(
                    hintText: "请输入用户密码", icon: Icon(Icons.ac_unit)),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new InkWell(
                  child: new Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        '忘记密码？',
                        style: hintTips,
                      ),
                      padding: new EdgeInsets.fromLTRB(
                          leftRightPadding, 10.0, leftRightPadding, 0.0)),
                  onTap: () {
                    print('忘记密码');
                    Navigator.pushNamed(context, '/forgetPassword');
                  },
                ),
                new InkWell(
                  child: new Container(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        '没有账号？马上注册',
                        style: hintTips,
                      ),
                      padding: new EdgeInsets.fromLTRB(
                          leftRightPadding, 10.0, leftRightPadding, 0.0)),
                  onTap: () {
                    print('打开注册');
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            ),
            new Container(
              width: 360.0,
              margin: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
              padding: new EdgeInsets.fromLTRB(leftRightPadding,
                  topBottomPadding, leftRightPadding, topBottomPadding),
              child: new Card(
                color: Color(0xFF63CA6C),
                elevation: 6.0,
                child: new FlatButton(
                    onPressed: () {
                      _postLogin(
                          _userNameController.text, _userPassController.text);
                    },
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        '马上登录',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              ),
            )
          ],
        ));
  }

  _postLogin(String userName, String userPassword) {
    if (userName.isNotEmpty && userPassword.isNotEmpty) {
      Map<String, String> params = new Map();
      params['username'] = userName;
      params['password'] = userPassword;
      Http.post(Api.USER_LOGIN, params: params, saveCookie: true)
          .then((result) {
        SpUtils.map2UserInfo(result).then((userInfoBean) {
          if (userInfoBean != null) {
            OsApplication.eventBus.fire(new LoginEvent(userInfoBean.username));
            SpUtils.saveUserInfo(userInfoBean);
            Navigator.pop(context);
          }
        });
      });
    } else {
      TsUtils.showShort('请输入用户名和密码');
    }
  }
}
