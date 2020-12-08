import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BindingApi implements BindingDataSource {
  final Dio _dio;
  final String _urlPrefix = "/api/v1/";
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  BindingApi(this._dio, this._auth, this._googleSignIn);

  @override
  Stream<bool> cacheAccessToken(String token) {
    throw UnimplementedError();
  }

  @override
  Stream<String> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Stream<bool> isAlreadyBinding() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getAccount(int userId) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  Future<SignEmailEntity> signWithEmail(SignEmailBody signEmailBody) {
    // TODO: implement signWithEmail
    throw UnimplementedError();
  }
}
