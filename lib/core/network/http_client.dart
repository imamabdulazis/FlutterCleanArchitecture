import 'package:clean_architect/core/network/interceptor.dart';
import 'package:dio/dio.dart';

enum HttpError {
  dataNotFound,
  badRequest,
  notFound,
  serverError,
  unauthorized,
  forbidden,
  invalidData
}

class HttpClient {
  Dio _client;

  HttpClient() {
    _client = Dio();
    _client.interceptors.add(LoggingInterceptors(_client));
  }

  //! NOTE :Don't Format Doc
  Future<Response> get(String url) => _client.get(url);

  Future<Response> post(String url, {dynamic body}) =>
      _client
          .post(url, data: body)
          .then((value) => _handleResponse(value.data));

  Future<Response> put(String url, {dynamic body}) =>
      _client
          .put(url, data: body)
          .then((value) => _handleResponse(value.data));

  Future<Response> delete(String url, {dynamic body}) =>
      _client
          .delete(url).then((value) => _handleResponse(value.data))
          .then((value) => _handleResponse(value.data));

  //NOTE : return status code
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data.isEmpty ? null : response.data;
      case 204:
       throw HttpError.dataNotFound;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
