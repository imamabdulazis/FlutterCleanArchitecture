import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/models/request/sign_body.dart';
import '../entities/login/LoginModalEntity.dart';
import '../repositories/UserRepository.dart';

class LoginUseCase extends UseCase<LoginModelEntity, SignEmailBody> {
  LoginUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Stream<Either<Failure, LoginModelEntity>> build(SignEmailBody body) {
    return _userRepository.signWithEmail(body);
  }
}
