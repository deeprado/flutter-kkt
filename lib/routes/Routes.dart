import 'package:flutter/material.dart';

import 'package:kkt/pages/fluwx/auth_by_qr_code_page.dart';
import 'package:kkt/pages/fluwx/launch_mini_program_page.dart';
import 'package:kkt/pages/fluwx/pay_page.dart';
import 'package:kkt/pages/fluwx/send_auth.dart';
import 'package:kkt/pages/fluwx/share_image_page.dart';
import 'package:kkt/pages/fluwx/share_mini_program.dart';
import 'package:kkt/pages/fluwx/share_music.dart';
import 'package:kkt/pages/fluwx/share_text.dart';
import 'package:kkt/pages/fluwx/share_video_page.dart';
import 'package:kkt/pages/fluwx/share_web_page.dart';
import 'package:kkt/pages/fluwx/sign_auto_deduct_page.dart';
import 'package:kkt/pages/fluwx/subscribe_message_page.dart';

import 'package:kkt/pages/Tabs.dart';
import 'package:kkt/pages/Home.dart';
import 'package:kkt/pages/Setting.dart';

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

import 'package:kkt/pages/student/StudentCreate.dart';
import 'package:kkt/pages/student/StudentList.dart';

import 'package:kkt/pages/survey/SurveyCreate.dart';

import 'package:kkt/pages/demo/EditorPage.dart';
import 'package:kkt/pages/demo/FilePage.dart';
import 'package:kkt/pages/demo/ShareSelectorPage.dart';
import 'package:kkt/pages/demo/PlayMusic.dart';
import 'package:kkt/pages/demo/VideoPage.dart';
import 'package:kkt/pages/demo/PlayVideo.dart';
import 'package:kkt/pages/demo/WidghtPage.dart';
import 'package:kkt/pages/demo/GradientCircularProgressRoute.dart';

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
  '/setting': (context) => SettingPage(),
  '/register': (context) => RegisterPage(),
  '/forgetPassword': (context) => ForgetPasswordPage(),
  '/exam/create': (context) => ExamCreatePage(),
  '/ques/list': (context) => QuesListPage(),
  '/ques/detial': (context) => QuesDetailPage(),
  '/ques/create': (context) => QuesCreatePage(),
  '/survey/create': (context) => SurveyCreatePage(),
  '/student/create': (context) => StudentCreatePage(),
  '/student/list': (context) => StudentListPage(),
  '/demo/progress': (context) => GradientCircularProgressRoute(),
  '/demo/widght': (context) => WidghtPage(),
  '/demo/file': (context) => FilePage(),
  '/demo/fluwx': (context) => ShareSelectorPage(),
  '/demo/audio': (context) => PlayMusicPage(),
  '/demo/video': (context) => VideoPage(),
  '/demo/video/play': (context) => PlayVideoPage(),
  "/fluwx/shareText": (context) => ShareTextPage(),
  "/fluwx/shareImage": (context) => ShareImagePage(),
  "/fluwx/shareWebPage": (context) => ShareWebPagePage(),
  "/fluwx/shareMusic": (context) => ShareMusicPage(),
  "/fluwx/shareVideo": (context) => ShareVideoPage(),
  "/fluwx/sendAuth": (context) => SendAuthPage(),
  "/fluwx/shareMiniProgram": (context) => ShareMiniProgramPage(),
  "/fluwx/pay": (context) => PayPage(),
  "/fluwx/launchMiniProgram": (context) => LaunchMiniProgramPage(),
  "/fluwx/subscribeMessage": (ctx) => SubscribeMessagePage(),
  "/fluwx/AuthByQRCode": (ctx) => AuthByQRCodePage(),
  '/fluwx/AutoDeduct': (ctx) => SignAutoDeductPage(),
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
