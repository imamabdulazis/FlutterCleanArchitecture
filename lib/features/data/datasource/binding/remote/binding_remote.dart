import '../../../../../core/network/http_client.dart';
import '../../../../domain/entities/login/LoginModalEntity.dart';
import '../../../../domain/entities/user/UserModelEntity.dart';
import '../../../models/request/sign_body.dart';
import '../binding_datasource.dart';

///don't forget add "async*" when using yield component
///because yield is component of Stream asynchronous

class BindingRemote implements BindingDataSource {
  BindingRemote(this.client);

  final HttpClient client;

  @override
  Stream<bool> isAlreadyBinding() {
    throw UnsupportedError('isAlready binding is not supported in binding Api');
  }

  Stream<String> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Stream<UserModelEntity> getAccount(int userId) {
    throw UnimplementedError();
  }

  @override
  Stream<LoginModelEntity> signWithEmail(SignEmailBody signEmailBody) {
    throw UnimplementedError();
  }

  @override
  Stream<String?> getPreferredLanguage() {
    throw UnsupportedError('Oops, languages not supported remote mode for now');
  }

  @override
  Stream<void> updatePreferredLanguage(String localeCode) {
    throw UnsupportedError(
        'Oops, please check again your binding factory! make sure that is local mode');
  }
}
