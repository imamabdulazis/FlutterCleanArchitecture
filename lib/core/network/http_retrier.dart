import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  final Dio? dio;
  final Connectivity? connectivity;

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription =
        connectivity!.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        streamSubscription.cancel();
        responseCompleter.complete(dio!.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
        ));
      }
    });
    return responseCompleter.future;
  }
}

class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  final DioConnectivityRequestRetrier? requestRetrier;

  @override
  Future onError(
      // ignore: avoid_renaming_method_parameters
      DioError err,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier!.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
