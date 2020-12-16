import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasources/binding/binding_cachesource.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BindingLocal implements BindingDataSource {
  SharedPreferences _prefs;

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
    // TODO: implement isAlreadyBinding
    throw UnimplementedError();
  }

  @override
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody) {
    // TODO: implement signWithEmail
    throw UnimplementedError();
  }
}
