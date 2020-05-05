import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kkt/app/OsApplication.dart';
import 'package:kkt/event/LoginEvent.dart';
import 'package:kkt/utils/WidgetsUtils.dart';
import 'package:kkt/utils/cache/SpUtils.dart';
import 'package:kkt/utils/net/Api.dart';
import 'package:kkt/utils/net/Http.dart';
import 'package:kkt/utils/toast/TsUtils.dart';

import 'package:kkt/widget/PartialConsume.dart';
import 'package:kkt/widget/CountDownTimeModel.dart';
import 'package:kkt/widget/VercodeTimer.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  WidgetsUtils widgetsUtils;
  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();
  var _userCodeController = new TextEditingController();
  var _passWordConfirmController = new TextEditingController();

  var leftRightPadding = 40.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "assets/images/login_logo.png";

  // 是否已读
  var flag = true;

  // 倒计时数值
  var countdownTime = 0;
  // 定时器
  Timer _timer;

  // 倒计时方法
  startCountdown() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) => {
          setState(() {
            if (countdownTime < 1) {
              _timer.cancel();
            } else {
              countdownTime = countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  String handleCodeAutoSizeText() {
    if (countdownTime > 0) {
      return "${countdownTime}s后重新获取";
    } else
      return "获取验证码";
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    widgetsUtils = new WidgetsUtils(context);
    return new Scaffold(
        appBar: new AppBar(
          title: widgetsUtils.getAppBar('注册'),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new CustomScrollView(
          shrinkWrap: true,
          // 内容
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(2.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    new Container(
                      child: new Image.asset(
                        LOGO,
                        fit: BoxFit.fitWidth,
                      ),
                      width: widgetsUtils.screenWidth,
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(leftRightPadding, 20.0,
                          leftRightPadding, topBottomPadding),
                      child: new TextField(
                        style: hintTips,
                        controller: _userNameController,
                        decoration: new InputDecoration(
                            hintText: "请输入手机号", icon: Icon(Icons.ac_unit)),
                        obscureText: false,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(leftRightPadding, 20.0,
                          leftRightPadding, topBottomPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: new TextField(
                              style: hintTips,
                              controller: _userCodeController,
                              decoration: new InputDecoration(
                                  hintText: "请输入短信验证码",
                                  icon: Icon(Icons.ac_unit)),
                              obscureText: true,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                if (countdownTime == 0) {
                                  setState(() {
                                    countdownTime = 60;
                                  });
                                  startCountdown();
                                }
                              },
                              child: Text(
                                handleCodeAutoSizeText(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: countdownTime > 0
                                      ? Color.fromARGB(255, 183, 184, 195)
                                      : Color.fromARGB(255, 17, 132, 255),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(leftRightPadding, 20.0,
                          leftRightPadding, topBottomPadding),
                      child: new TextField(
                        style: hintTips,
                        controller: _userPassController,
                        decoration: new InputDecoration(
                            hintText: "请输入用户密码(8-20位，包含英文)",
                            icon: Icon(Icons.ac_unit)),
                        obscureText: true,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(leftRightPadding, 20.0,
                          leftRightPadding, topBottomPadding),
                      child: new TextField(
                        style: hintTips,
                        controller: _passWordConfirmController,
                        decoration: new InputDecoration(
                            hintText: "请再次输入用户密码", icon: Icon(Icons.ac_unit)),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(leftRightPadding, 15.0,
                          leftRightPadding, topBottomPadding),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: this.flag,
                            onChanged: (v) {
                              setState(() {
                                this.flag = v;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Container(
                            child: Text('我已阅读并同意相关服务条款和隐私政策'),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      width: 360.0,
                      margin: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                      padding: new EdgeInsets.fromLTRB(leftRightPadding,
                          topBottomPadding, leftRightPadding, topBottomPadding),
                      child: new Card(
                        color: Color(0xFF63CA6C),
                        elevation: 6.0,
                        child: new FlatButton(
                            onPressed: () {
                              _postRegister(
                                  _userNameController.text,
                                  _userPassController.text,
                                  _passWordConfirmController.text);
                            },
                            child: new Padding(
                              padding: new EdgeInsets.all(10.0),
                              child: new Text(
                                '注册',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void _postRegister(String userName, String password, String passWordConfirm) {
    if (userName.isNotEmpty &&
        password.isNotEmpty &&
        passWordConfirm.isNotEmpty) {
      if (password == passWordConfirm) {
        Map<String, String> params = new Map();
        params['username'] = userName;
        params['password'] = password;
        params['repassword'] = passWordConfirm;

        Navigator.pushReplacementNamed(context, '/tabs');

        // Http.post(Api.USER_REGISTER, params: params, saveCookie: true)
        //     .then((result) {
        //   SpUtils.map2UserInfo(result).then((userInfoBean) {
        //     if (userInfoBean != null) {
        //       OsApplication.eventBus
        //           .fire(new LoginEvent(userInfoBean.username));
        //       SpUtils.saveUserInfo(userInfoBean);
        //       Navigator.pushReplacementNamed(context, '/tabs');
        //     }
        //   });
        // });
      } else {
        TsUtils.showShort('两次密码不一致哟~');
      }
    } else {
      TsUtils.showShort('请输入用户名和密码');
    }
  }
}
