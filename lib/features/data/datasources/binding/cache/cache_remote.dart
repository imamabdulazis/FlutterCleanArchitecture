import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasources/binding/cache/cache_local.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRemote implements BindingDataSource {
  final SharedPreferences pref;

  CacheRemote(this.pref);

  @override
  Stream<bool> cacheAccessToken(String token) {
    throw UnimplementedError();
  }

  @override
  Stream<String> getAccessToken() {
    // return Stream.value(_cacheStorage.get(StorageKeys.accessToken));
    throw UnimplementedError();
  }

  @override
  Stream<bool> isAlreadyBinding() {
    // return prefs.isAccessTOkenExists();
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getAccount(int userId) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody) {
    // TODO: implement signWithEmail
    throw UnimplementedError();
  }

}
