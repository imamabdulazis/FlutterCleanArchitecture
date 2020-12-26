import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';

abstract class BindingDataSource {
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody);

  Future<UserEntity> getAccount(int userId);

  Stream<bool> isAlreadyBinding();

  Stream<bool> cacheAccessToken(String token);

  Stream<String> getAccessToken();
}
