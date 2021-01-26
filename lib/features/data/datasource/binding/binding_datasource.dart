import '../../../domain/entities/request/sign_entity.dart';
import '../../../domain/entities/response/user_model_entity.dart';
import '../../models/request/sign_body.dart';

///declare [resource] datasource binding to [remote] and [local]
abstract class BindingDataSource {
  ///[check] is user already [login]
  Stream<bool> isAlreadyBinding();

  ///do sign in user
  Stream<SignModelEntity> signWithEmail(SignEmailBody signEmailBody);

  ///get [account] user
  Stream<UserModelEntity> getAccount(int userId);

  ///get [access] token
  Stream<String> getAccessToken();
}
