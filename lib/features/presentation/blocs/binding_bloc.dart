import 'package:clean_architect/features/data/datasources/binding/network/binding_api.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BindingBloc {
  final BindingApi bindingApi;
  Dio dio;


  BindingBloc(this.bindingApi);

}
