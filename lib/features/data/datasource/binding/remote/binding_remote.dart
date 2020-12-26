import 'package:clean_architect/core/network/http_client.dart';
import 'package:clean_architect/features/data/datasource/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';

class BindingRemote implements BindingDataSource {
  final HttpClient httpClient;

  BindingRemote(this.httpClient);

  @override
  Stream<bool> cacheAccessToken(String token) {
    // TODO: implement cacheAccessToken
    throw UnimplementedError();
  }

  @override
  Stream<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getAccount(int userId) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  Stream<bool> isAlreadyBinding() {
    throw UnsupportedError('isAlready binding is not supported in binding Api');
  }

  @override
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody) {
    // TODO: implement signWithEmail
    throw UnimplementedError();
  }
}
