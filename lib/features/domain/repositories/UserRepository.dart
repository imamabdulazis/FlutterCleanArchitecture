import '../entities/login/LoginModalEntity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/request/sign_body.dart';
import '../entities/user/UserModelEntity.dart';

abstract class UserRepository {
  Stream<Either<Failure, bool>> checkBindStatus();

  Stream<Either<Failure, LoginlModelEntity>> signWithEmail(SignEmailBody body);

  Stream<Either<Failure, UserModelEntity>> getAccount(int userId);
}
