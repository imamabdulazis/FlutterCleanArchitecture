import 'package:equatable/equatable.dart';

class LoginlModelEntity extends Equatable {
  const LoginlModelEntity({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object> get props => [accessToken!, refreshToken!];
}
