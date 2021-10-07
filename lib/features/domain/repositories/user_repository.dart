import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/domain/entities/request/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/response/user_model_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Stream<Either<Failure, bool>> checkBindStatus();

  Stream<Either<Failure, SignModelEntity>> signWithEmail(SignEmailBody body);

  Stream<Either<Failure, UserModelEntity>> getAccount(int userId);
}
