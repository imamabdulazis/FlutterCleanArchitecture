import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/domain/repositories/AppRepository.dart';
import 'package:dartz/dartz.dart';

class GetPreferredLanguageUseCase extends UseCase<String, NoParams> {
  GetPreferredLanguageUseCase(this.appRepository);

  final AppRepository appRepository;

  @override
  Stream<Either<Failure, String>> build(NoParams params) {
    return appRepository.getPreferredLanguage();
  }
}
