// import 'package:clean_architect/core/error/failure.dart';
// import 'package:clean_architect/features/data/datasources/common/base_datasource_factory.dart';
// import 'package:clean_architect/features/data/datasources/datasource_factory.dart';
// import 'package:clean_architect/features/domain/entities/sign_entity.dart';
// import 'package:clean_architect/features/domain/repositories/user_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';
// import 'package:logger/logger.dart';

// class UserRepositoryImpl implements UserRepository {
//   BindingDataSourceFactory _bindingDataSourceFactory;
//   Logger _logger = Logger();

//   UserRepositoryImpl(
//       {@required BindingDataSourceFactory bindingDataSourceFactory})
//       : _bindingDataSourceFactory = bindingDataSourceFactory;

//   @override
//   Stream<Either<Failure, bool>> checkBindStatus() {
//     return _bindingDataSourceFactory
//         .createData(DataSourceState.local)
//         .isAlreadyBinding()
//         .map((event) => Right(event));
//   }

//   @override
//   Stream<Either<Failure, SignEmailEntity>> signWithEmail() {
//     // return _bindingDataSourceFactory
//     //     .createData(DataSourceState.network)
//     //     .isAlreadyBinding()
//     //     .map((event) => Right(event));
//   }

//   @override
//   Stream<Either<Failure, SignSocialEntity>> signWithSocial() {
//     throw UnimplementedError();
//   }
// }
