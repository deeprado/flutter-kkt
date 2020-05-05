import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';

import 'package:kkt/app/OsApplication.dart';
import 'package:kkt/utils/net/Api.dart';
import 'package:kkt/utils/toast/TsUtils.dart';
import 'package:kkt/utils/cache/SpUtils.dart';

Dio dio = new Dio();

class Http {
//  get 请求
  static Future<dynamic> get(String url,
      {Map<String, String> params, bool saveCookie = false}) async {
    if (params == null) {
      params = new Map();
    }
    String _url = Api.BASE_URL + url;
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=$value" + "&");
      });
      String paramStr = sb.toString();
      print('参数是$params');
      paramStr = paramStr.substring(0, paramStr.length - 1);
      _url += paramStr;
    }
    print('url是$url');
    Response res = await dio.get(_url);
    if (res.statusCode == 200) {
      var cookie = res.headers['set-cookie'];
      if (saveCookie) {
        SpUtils.saveCookie(cookie);
        OsApplication.cookie = cookie.toString();
      }
      String body = res.data;
      var jsonStr = json.decode(body);
      int errCode = jsonStr['errorCode'];
      if (errCode == 0) {
        dynamic data = jsonStr['data'];
        print('the data of method is $data');
        return body;
      } else {
        TsUtils.showShort(jsonStr['errorMsg']);
      }
    } else {
      TsUtils.showShort('您的网络好像不太好哟~~~///(^v^)\\\~~~');
    }
  }

  //  post请求
  static Future<Map> post(String url,
      {Map<String, String> params, bool saveCookie = false}) async {
    if (params == null) {
      params = new Map();
    }
    String _url = Api.BASE_URL + url;
    if (OsApplication.cookie != null) {
      params['Cookie'] = OsApplication.cookie;
    }
    Response res = await dio.post(_url, data: params);
    return _dealWithRes(res, saveCookie: saveCookie);
  }

  // 上传
  static Future<Response> upload(String url,
      {FormData formdata, bool saveCookie = false}) async {
 
    String _url = Api.BASE_URL + url;
 
    Response res = await dio.post(_url, data: formdata);
    return res;
  }

  static Map<String, dynamic> _dealWithRes(var res, {bool saveCookie}) {
    if (res.statusCode == 200) {
      var cookie = res.headers['set-cookie'];
      if (saveCookie) {
        SpUtils.saveCookie(cookie);
        OsApplication.cookie = cookie;
      }
      String body = res.body;
      var jsonStr = json.decode(body);
      print('the jsonStr is $jsonStr');
      int errCode = jsonStr['errorCode'];
      if (errCode == 0) {
        var data = jsonStr['data'];
        return data;
      } else {
        TsUtils.showShort(jsonStr['errorMsg']);
        return null;
      }
    } else {
      TsUtils.showShort('您的网络好像不太好哟~~~///(^v^)\\\~~~');
      return null;
    }
  }
}
