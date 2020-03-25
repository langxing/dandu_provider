
import 'package:dio/dio.dart';

/// 添加header认证
class AuthInterceptor extends Interceptor {

  String PLATFORM = "android";

  @override
  onRequest(RequestOptions options) async{
    Map<String, String> headers = new Map();
    headers["Accept-Charset"] = "utf-8";
    headers["Connection"] = "keep-alive";
    headers["Accept"] = "*/*";
    headers["x-version"] = "1.0.0";
    headers["x-platform"] = PLATFORM;
    options.headers=headers;
    return super.onRequest(options);
  }
}