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