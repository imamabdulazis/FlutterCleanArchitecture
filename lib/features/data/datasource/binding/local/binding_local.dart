import 'package:clean_architect/features/common/constants/language_constants.dart';

import '../../../../domain/entities/login/LoginModalEntity.dart';

import '../../../../common/constants/prefs_constants.dart';

import '../../../../domain/entities/user/UserModelEntity.dart';
import '../../../models/request/sign_body.dart';
import '../binding_datasource.dart';
import '../cache/shared_prefs.dart';

///don't forget add "async*" when using yield component
///because yield is component of Stream asynchronous

class BindingLocal implements BindingDataSource {
  BindingLocal(this.pref);

  final SharedPref? pref;

  @override
  Stream<bool> isAlreadyBinding() async* {
    yield pref!.isKeyExists(Constants.keyAccessToken);
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
  Stream<String?> getPreferredLanguage() async* {
    yield pref!.getString(Constants.keyLanguage) ??
        Languages.languages[0].code!;
  }

  @override
  Stream<void> updatePreferredLanguage(String localeCode) async* {
    yield pref!.putString(Constants.keyLanguage, localeCode);
  }
}
