import '../../../domain/entities/login/LoginModalEntity.dart';

import '../../../domain/entities/user/UserModelEntity.dart';
import '../../models/request/sign_body.dart';

///declare [resource] datasource binding to [remote] and [local]
abstract class BindingDataSource {
  ///[check] is user already [login]
  Stream<bool> isAlreadyBinding();

  ///do sign in user
  Stream<LoginlModelEntity> signWithEmail(SignEmailBody signEmailBody);

  ///get [account] user
  Stream<UserModelEntity> getAccount(int userId);
}
