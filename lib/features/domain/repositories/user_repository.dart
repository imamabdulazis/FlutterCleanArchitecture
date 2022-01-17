import '../../../core/error/failure.dart';
import '../../data/models/request/sign_body.dart';
import '../entities/request/sign_entity.dart';
import '../entities/response/user_model_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Stream<Either<Failure, bool>> checkBindStatus();

  Stream<Either<Failure, SignModelEntity>> signWithEmail(SignEmailBody body);

  Stream<Either<Failure, UserModelEntity>> getAccount(int userId);
}
