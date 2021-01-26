import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../features/data/datasource/binding/cache/constants.dart';
import '../../features/data/datasource/binding/cache/share_prefs.dart';
import '../env/config.dart';

class HttpClient {
  Config config;
  SharedPrefs prefs;

  // ignore: sort_constructors_first
  HttpClient({this.config, this.prefs});

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = new BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    final dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
      final storageToken = prefs.getString(Constants.accessToken);

      print(
          "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
      print('Headers:');
      options.headers.forEach((k, v) => print('$k: $v'));
      if (options.queryParameters != null) {
        print('queryParameters:');
        options.queryParameters.forEach((k, v) => print('$k: $v'));
      }
      print(
          "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

      if (options.headers.containsKey('isToken')) {
        options.headers.remove('isToken');
        options.headers.addAll({'Authorization': 'Bearer $storageToken'});
      }
      // Do something before request is sent
      debugPrint('\n'
          '-- headers --\n'
          '${options.headers.toString()} \n'
          '-- response --\n -->x'
          '${options.data} \n'
          '');

      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) {
      // Do something with response data
      debugPrint("\n"
          'Response : ${response.request.uri} \n'
          '-- headers --\n'
          '${response.headers.toString()} \n'
          '-- response --\n'
          '${jsonEncode(response.data)} \n'
          '');
      return response; // continue
    }, onError: (DioError e) {
      // Do something with response error
      return e; //continue
    });
  }
}
