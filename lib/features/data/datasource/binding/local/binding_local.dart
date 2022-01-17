import '../../../../common/constants/prefs_constants.dart';

import '../../../../domain/entities/request/sign_entity.dart';
import '../../../../domain/entities/response/user_model_entity.dart';
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
  Stream<SignModelEntity> signWithEmail(SignEmailBody signEmailBody) {
    throw UnimplementedError();
  }
}
