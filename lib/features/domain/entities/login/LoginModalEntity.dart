import 'package:equatable/equatable.dart';

class LoginModelEntity extends Equatable {
  const LoginModelEntity({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object> get props => [accessToken!, refreshToken!];
}
