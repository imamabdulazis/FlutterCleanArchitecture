import 'dart:convert';

import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  final String apiBaseUrl;
  SharedPrefs prefs;

  HttpClient(this.apiBaseUrl);

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = new BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    Dio dio = new Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
      // final storageToken = prefs.getString(Constant.accessToken);
      //
      // options.headers.addAll({'Authorization': 'Bearer $storageToken'});
      // Do something before request is sent
      debugPrint("\n"
          "Request ${options.uri} \n"
          "-- headers --\n"
          "${options.headers.toString()} \n"
          "-- response --\n  x"
          "${jsonEncode(options.data)} \n"
          "");

      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) {
      // Do something with response data
      debugPrint("\n"
          "Response ${response.request.uri} \n"
          "-- headers --\n"
          "${response.headers.toString()} \n"
          "-- response --\n"
          "${jsonEncode(response.data)} \n"
          "");
      return response; // continue
    }, onError: (DioError e) {
      // Do something with response error
      return e; //continue
    });
  }

}
