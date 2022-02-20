import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/domain/repositories/AppRepository.dart';
import 'package:dartz/dartz.dart';

class UpdateLanguageUseCase extends UseCase<void, String> {
  UpdateLanguageUseCase(this.appRepository);

  final AppRepository appRepository;
  @override
  Stream<Either<Failure, void>> build(String params) {
    return appRepository.updatePreferredLanguage(params);
  }
}
