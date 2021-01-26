import 'package:clean_architect/core/network/http_client.dart';
import 'package:clean_architect/features/data/datasource/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/request/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/response/user_model_entity.dart';

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
  Stream<SignModelEntity> signWithEmail(SignEmailBody signEmailBody) {
    throw UnimplementedError();
  }
}
