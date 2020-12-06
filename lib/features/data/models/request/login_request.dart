import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
