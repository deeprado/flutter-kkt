import 'package:dio/dio.dart';

/*
 * header拦截器
 */
class HeaderInterceptors extends InterceptorsWrapper {


  @override
  Future onRequest(RequestOptions options) async {
    /// 超时
    options.connectTimeout = 15000;

    return options;
  }
}