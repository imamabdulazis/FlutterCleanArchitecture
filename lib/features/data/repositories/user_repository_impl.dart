import 'package:clean_architect/features/domain/entities/login/LoginModalEntity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/user/UserModelEntity.dart';
import '../../domain/repositories/UserRepository.dart';
import '../datasource/common/base_datasource_factory.dart';
import '../datasource/datasource_factory.dart';
import '../models/request/sign_body.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required BindingDataSourceFactory? bindingDataSourceFactory,
  }) : _bindingDataSourceFactory = bindingDataSourceFactory;

  final BindingDataSourceFactory? _bindingDataSourceFactory;

  @override
  Stream<Either<Failure, bool>> checkBindStatus() {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .isAlreadyBinding()
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, LoginlModelEntity>> signWithEmail(SignEmailBody body) {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.network)!
        .signWithEmail(body)
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, UserModelEntity>> getAccount(int userId) async* {
    try {
      _bindingDataSourceFactory!
          .createData(DataSourceState.network)!
          .getAccount(userId)
          .map((event) => Right(event));
    } on ServerException {
      yield Left(ServerFailure(error: 'Cannot get User from server'));
    }
  }
}
