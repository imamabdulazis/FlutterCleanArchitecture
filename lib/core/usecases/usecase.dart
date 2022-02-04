import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error, stackTrace) {
      print('Error-streams      : $error');
      print('StackTrace-streams :$stackTrace');
      Failure failure;

      if (error is Failure) {
        failure = error;
      } else if (error is DioError) {
        failure = ServerFailure(error: error);
      } else {
        failure = AnotherFailure(error: '$error');
      }

      ///[return error value]
      ///if stream getting error will return left option on Either
      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
