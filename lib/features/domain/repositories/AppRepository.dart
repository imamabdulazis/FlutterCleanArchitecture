import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/features/domain/entities/language/LanguageEntity.dart';
import 'package:dartz/dartz.dart';

abstract class AppRepository {
  Stream<Either<Failure, String>> getPreferredLanguage();

  Stream<Either<Failure, void>> updatePreferredLanguage(String code);
}
