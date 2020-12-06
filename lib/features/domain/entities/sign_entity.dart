import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SignEmailEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

  SignEmailEntity({
    @required this.accessToken,
    @required this.refreshToken,
  });

  @override
  List<Object> get props => [accessToken, refreshToken];
}

class SignSocialEntity extends Equatable {
  final String token;
  final String email;
  final String username;

  SignSocialEntity({
    @required this.token,
    @required this.email,
    @required this.username,
  });

  @override
  List<Object> get props => [token, email, username];
}
