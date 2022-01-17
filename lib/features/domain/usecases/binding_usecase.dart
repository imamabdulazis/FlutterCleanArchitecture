import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class CheckBindStatusUsecase extends UseCase<bool, NoParams> {
  final UserRepository _userRepository;

  CheckBindStatusUsecase(this._userRepository){
    print("create checkBinding status");
  }

  @override
  Stream<Either<Failure, bool>> build(NoParams params) {
    print('build checkBindingStatus');
    return _userRepository.checkBindStatus();
  }
}