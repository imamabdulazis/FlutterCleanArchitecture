import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String username,
    @required String email,
    @required String avatar,
  }) : super(
          username: username,
          email: email,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'avatar': avatar,
    };
  }
}
