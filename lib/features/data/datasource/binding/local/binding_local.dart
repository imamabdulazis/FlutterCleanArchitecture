import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';

import '../../../../common/constants/prefs_constants.dart';

import '../../../../domain/entities/user/UserModelEntity.dart';
import '../../../models/request/sign_body.dart';
import '../binding_datasource.dart';
import '../cache/shared_prefs.dart';

class BindingLocal implements BindingDataSource {
  BindingLocal(this.prefs);

  final SharedPrefs? prefs;

  @override
  Stream<bool> isAlreadyBinding() async* {
    final status = prefs!.isKeyExists(Constants.keyAccessToken);
    yield status;
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
