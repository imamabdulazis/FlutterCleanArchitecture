import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';

import '../../../../../core/network/http_client.dart';
import '../../../../domain/entities/user/UserModelEntity.dart';
import '../../../models/request/sign_body.dart';
import '../binding_datasource.dart';

class BindingRemote implements BindingDataSource {
  final HttpClient client;

  BindingRemote(this.client);

  @override
  Stream<bool> isAlreadyBinding() {
    throw UnsupportedError('isAlready binding is not supported in binding Api');
  }

  @override
  Stream<String> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Stream<UserModelEntity> getAccount(int userId) {
    throw UnimplementedError();
  }

  @override
  Stream<LoginlModelEntity> signWithEmail(SignEmailBody signEmailBody) {
    throw UnimplementedError();
  }
}
