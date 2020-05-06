import 'package:flutter/material.dart';

import 'package:kkt/pages/Tabs.dart';
import 'package:kkt/pages/Home.dart';

import 'package:kkt/pages/User.dart';
import 'package:kkt/pages/Profile.dart';

import 'package:kkt/pages/Help.dart';
import 'package:kkt/pages/About.dart';
import 'package:kkt/pages/Feedback.dart';
import 'package:kkt/pages/Search.dart';

import 'package:kkt/pages/auth/Login.dart';
import 'package:kkt/pages/auth/Register.dart';
import 'package:kkt/pages/auth/ForgetPassword.dart';

import 'package:kkt/pages/question/QuesList.dart';
import 'package:kkt/pages/question/QuesDetail.dart';
import 'package:kkt/pages/question/QuesCreate.dart';

import 'package:kkt/pages/exam/ExamCreate.dart';

import 'package:kkt/pages/survey/SurveyCreate.dart';

import 'package:kkt/widget/EditorPage.dart';

// 配置路由
final routes = {
  '/': (context) => HomePage(),
  '/tabs': (context) => Tabs(),
  '/user': (context) => UserPage(),
  '/help': (context) => HelpPage(),
  '/about': (context) => AboutPage(),
  '/feedback': (context) => FeedbackPage(),
  '/profile': (context) => ProfilePage(),
  '/editor': (context) => EditorPage(),
  '/search': (context) => SearchPage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/forgetPassword': (context) => ForgetPasswordPage(),
  '/exam/create': (context) => ExamCreatePage(),
  '/ques/list': (context) => QuesListPage(),
  '/ques/detial': (context) => QuesDetailPage(),
  '/ques/create': (context) => QuesCreatePage(),
  '/survey/create': (context) => SurveyCreatePage(),
};

// 固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
