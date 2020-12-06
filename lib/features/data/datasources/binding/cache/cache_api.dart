import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasources/binding/cache/cache_storage.dart';

class CacheApi implements BindingDataSource {
  final SharePreferenceManager pref;

  CacheApi(this.pref);

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
  Future<bool> signOutSocial() {
    throw UnimplementedError();
  }

  @override
  Future<String> signWithSocial() {
    throw UnimplementedError();
  }

}
