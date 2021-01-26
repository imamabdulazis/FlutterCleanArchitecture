import 'package:equatable/equatable.dart';

class SignModelEntity extends Equatable {
  final String accessToken;
  final String refreshToken;

  SignModelEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object> get props => [accessToken, refreshToken];
}
