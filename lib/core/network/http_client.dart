import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../features/common/constants/prefs_constants.dart';
import '../../features/data/datasource/binding/cache/shared_prefs.dart';
import '../env/config.dart';
import 'http_retrier.dart';

class HttpClient {
  HttpClient({required this.config, required this.prefs});
  
  late Config config;
  late SharedPrefs prefs;

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: config.apiBaseUrl!,
      connectTimeout: 20000,
      receiveTimeout: 30000,
      receiveDataWhenStatusError: true,
      headers: {'isToken': prefs.isKeyExists(Constants.keyAccessToken)},
    );
    final dynamic dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(onRequest: (options, handler) {
      final storageToken = prefs.getString(Constants.keyAccessToken);

      print("--> ${options.method} ${"" + (options.baseUrl) + (options.path)}");
      print('Headers:');
      options.headers.forEach((k, v) => print('$k: $v'));
      print('queryParameters:');
      options.queryParameters.forEach((k, v) => print('$k: $v'));
      print(
        "--> END ${options.method}",
      );

      if (options.headers.containsKey('isToken')) {
        options.headers.remove('isToken');
        options.headers.addAll({'Authorization': 'Bearer $storageToken'});
      }

      // Do something before request is sent
      debugPrint('\n'
          '-- headers --\n'
          '${options.headers.toString()} \n'
          '-- request --\n -->body'
          '${options.data} \n'
          '');

      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response, handler) {
      // Do something with response data
      debugPrint('\n'
          'Response : ${response.requestOptions.uri} \n'
          '-- headers --\n'
          '${response.headers.toString()} \n'
          '-- response --\n'
          '${jsonEncode(response.data)} \n'
          '');

      return handler.next(response); // continue
    }, onError: (DioError error, handler) {
      // Do something with response error
      return handler.next(error); //continue
    });
  }
}
