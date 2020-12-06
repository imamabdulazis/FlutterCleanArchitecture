import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Stream<Either<Failure, bool>> checkBindStatus();

  Stream<Either<Failure, SignEmailEntity>> signWithEmail();

  Stream<Either<Failure, SignSocialEntity>> signWithSocial();

  // Stream<Either<Failure, UserEntity>> getAccount();
}
