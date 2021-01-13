import 'package:clean_architect/features/data/datasource/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/constants.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';


class BindingLocal implements BindingDataSource {
  final SharedPrefs prefs;

  BindingLocal(this.prefs);

  @override
  Stream<bool> isAlreadyBinding() async* {
    var status = prefs.isKeyExists(Constants.accessToken);
    yield status;
  }

  @override
  Stream<String> getAccessToken() async* {
    yield prefs.getString(Constants.accessToken);
  }

  @override
  Future<UserEntity> getAccount(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody) {
    throw UnimplementedError();
  }
}
