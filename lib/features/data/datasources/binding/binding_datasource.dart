
abstract class BindingDataSource {
  //implementation request api
  // Future<SignEntity> createBinding(authModelRequest);

  //implementation social auth
  Future<String> signWithSocial();

  Future<bool> signOutSocial();

  Stream<bool> isAlreadyBinding();

  Stream<bool> cacheAccessToken(String token);

  Stream<String> getAccessToken();
}
