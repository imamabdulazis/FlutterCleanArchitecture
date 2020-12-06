import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
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
  Future<bool> signOutSocial() {
    throw UnimplementedError();
  }

  @override
  Future<String> signWithSocial() {
    throw UnimplementedError();
  }
}
