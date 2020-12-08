import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String email;
  final String avatar;

  UserEntity({
    @required this.email,
    @required this.username,
    @required this.avatar,
  });

  @override
  List<Object> get props => [username, email, avatar];
}
