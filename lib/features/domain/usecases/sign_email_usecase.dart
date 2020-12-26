import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SignEmailAccountUsecase
    extends UseCase<SignEmailEntity, SignEmailBody> {
  final UserRepository _userRepository;

  SignEmailAccountUsecase(this._userRepository);

  @override
  Stream<Either<Failure, SignEmailEntity>> build(SignEmailBody body) {
    return _userRepository.signWithEmail(body);
  }
}
