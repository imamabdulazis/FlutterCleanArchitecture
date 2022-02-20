import '../../../domain/entities/login/LoginModalEntity.dart';

import 'package:flutter/foundation.dart';

class SignEmailModel extends LoginModelEntity {
  const SignEmailModel({
    @required String? accessToken,
    @required String? refreshToken,
  }) : super(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory SignEmailModel.fromJson(Map<String, dynamic> json) {
    return SignEmailModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
