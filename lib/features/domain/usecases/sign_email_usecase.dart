import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/models/request/sign_body.dart';
import '../entities/request/sign_entity.dart';
import '../repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignEmailAccountUsecase
    extends UseCase<SignModelEntity, SignEmailBody> {
  final UserRepository _userRepository;

  SignEmailAccountUsecase(this._userRepository);

  @override
  Stream<Either<Failure, SignModelEntity>> build(SignEmailBody body) {
    return _userRepository.signWithEmail(body);
  }
}
