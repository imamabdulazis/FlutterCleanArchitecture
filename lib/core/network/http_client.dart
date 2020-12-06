import 'package:clean_architect/core/network/interceptor.dart';
import 'package:dio/dio.dart';

class HttpClient{
  Dio _client;

  HttpClient(){
    _client=Dio();
    _client.interceptors.add(LoggingInterceptors(_client));
  }
  //jgn di format doc
  Future<Response> get(String url) => _client.get(url);
  Future<Response> post(String url, { dynamic body }) => _client.post(url, data: body);
  Future<Response> put(String url, { dynamic body }) => _client.put(url, data: body);
  Future<Response> delete(String url, { dynamic body }) => _client.delete(url);

}