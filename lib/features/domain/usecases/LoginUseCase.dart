import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/models/request/sign_body.dart';
import '../repositories/UserRepository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<LoginlModelEntity, SignEmailBody> {
  LoginUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Stream<Either<Failure, LoginlModelEntity>> build(SignEmailBody body) {
    return _userRepository.signWithEmail(body);
  }
}
