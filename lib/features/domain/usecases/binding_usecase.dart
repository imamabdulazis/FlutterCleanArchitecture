import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class CheckBindStatusUsecase extends UseCase<bool, NoParams> {
  final UserRepository _userRepository;

  CheckBindStatusUsecase(this._userRepository);

  @override
  Stream<Either<Failure, bool>> build(NoParams params) {
    return _userRepository.checkBindStatus();
  }
}

class BindToEmailAccountUsecase extends UseCase<SignEmailEntity, NoParams> {
  final UserRepository _userRepository;

  BindToEmailAccountUsecase(this._userRepository);

  @override
  Stream<Either<Failure, SignEmailEntity>> build(NoParams params) {
    return _userRepository.signWithEmail();
  }
}

class BindToSocialAccountUsecase extends UseCase<SignSocialEntity, NoParams> {
  final UserRepository _userRepository;

  BindToSocialAccountUsecase(this._userRepository) {
    print('create check bind status');
  }

  @override
  Stream<Either<Failure, SignSocialEntity>> build(NoParams params) {
    return _userRepository.signWithSocial();
  }
}
