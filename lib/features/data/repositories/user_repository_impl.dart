import 'package:clean_architect/core/error/exception.dart';
import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/network/network_info.dart';
import 'package:clean_architect/features/data/datasource/common/base_datasource_factory.dart';
import 'package:clean_architect/features/data/datasource/datasource_factory.dart';
import 'package:clean_architect/features/data/models/request/sign_body.dart';
import 'package:clean_architect/features/data/models/response/sign_model.dart';
import 'package:clean_architect/features/domain/entities/sign_entity.dart';
import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:clean_architect/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class UserRepositoryImpl implements UserRepository {
  BindingDataSourceFactory _bindingDataSourceFactory;
  NetworkInfo networkInfo;

  UserRepositoryImpl({
    @required BindingDataSourceFactory bindingDataSourceFactory,
  }) : _bindingDataSourceFactory = bindingDataSourceFactory;

  @override
  Stream<Either<Failure, bool>> checkBindStatus() {
    return _bindingDataSourceFactory
        .createData(DataSourceState.local)
        .isAlreadyBinding()
        .map((event) => Right(event));
  }

  @override
  Stream<Either<Failure, SignEmailEntity>> signWithEmail(
      SignEmailBody body) async* {

    final SignEmailModel model = await _bindingDataSourceFactory
        .createData(DataSourceState.network)
        .signWithEmail(body);

    //NOTE : verified if token is valid
    bool isSuccess = await _bindingDataSourceFactory
        .createData(DataSourceState.network)
        .cacheAccessToken(model.accessToken)
        .single;

    if (!isSuccess) {
      yield Left(CacheFailure(message: "Cannot retrieve access token"));
    }
    yield Right(model);
  }

  //NOTE : get account
  @override
  Stream<Either<Failure, UserEntity>> getAccount(int userId) async* {
    if (await networkInfo.isConnected) {
      try {
        final dataUser = await _bindingDataSourceFactory
            .createData(DataSourceState.network)
            .getAccount(userId);
        yield Right(dataUser);
      } on ServerException {
        yield Left(ServerFailure(message: "Cannot get User from server"));
      }
    }
    yield Left(ServerFailure(message: "Network request failure"));
  }
}
