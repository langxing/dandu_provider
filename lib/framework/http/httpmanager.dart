import 'dart:io';
import 'package:dandu_provider/framework/http/auth_interceptor.dart';
import 'package:dandu_provider/model/baseresponse.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class HttpManager {
  static HttpManager _httpManager;
  Observable<Response> _observable;
  Dio _dio;

  HttpManager() {
    BaseOptions options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        // api 头部例如 https://www.baidu.com
        baseUrl: "http://static.owspace.com",
        contentType: new ContentType('application', 'x-www-form-urlencoded',
            charset: 'utf-8'));
    _dio = Dio(options);
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LogInterceptor());
  }

  static HttpManager getInstance() {
    if (_httpManager == null) {
      _httpManager = HttpManager();
    }
    return _httpManager;
  }

  Future<Response> _get(String url, {Map<String, dynamic> params}) async {
    Response response = await _dio.get(url, queryParameters: params);
    print(response.data);
    print("type=${response.data.runtimeType}");
    return response;
  }

  Future<Response> _post(String url, {Map<String, dynamic> params}) async {
    Response response = await _dio.post(url, queryParameters: params);
    print(response.data);
    print("type=${response.data.runtimeType}");
    return response;
  }

  HttpManager get(String url, {Map<String, dynamic> params}) {
    _observable =
        Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
    return this;
  }

  HttpManager post(String url, {Map<String, dynamic> params}) {
    _observable =
        Observable.fromFuture(_post(url, params: params)).asBroadcastStream();
    return this;
  }

  void mapToList({void onSuccess(List<dynamic> data), void onError(int code, String msg)}) {
    _observable.map<BaseResponse>((Response data) {
      print("map:$data");
      return BaseResponse.fromJsonList(data.data);
    }).listen((BaseResponse res) {
      if (res.code == 0) {
        onSuccess(res.list);
      } else {
        onError(res.code, res.msg);
      }
    });
  }

  void mapToObject({void onSuccess(dynamic data), void onError(int code, String msg)}) {
    _observable.map<BaseResponse>((dynamic data) {
      print("map:$data");
      return BaseResponse.fromJsonObject(data);
    }).listen((BaseResponse res) {
      if (res.code == 0) {
        onSuccess(res.data);
      } else {
        onError(res.code, res.msg);
      }
    });
  }

}
