import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/core/utils/result_state.dart';
import 'package:clean_architect/features/domain/usecases/binding_usecase.dart';
import 'package:rxdart/rxdart.dart';

class InitialBloc {
  final CheckBindStatusUsecase _checkBindStatusUsecase;

  final _bindStatusOut = PublishSubject<ResultState<bool>>();

  InitialBloc(this._checkBindStatusUsecase) {
    print('initial bloc');
  }

  Function(ResultState<bool>) get bindOut => _bindStatusOut.sink.add;

  Stream<ResultState<bool>> get bindStatusStream => _bindStatusOut.stream;

  checkBindStatus() {
    print('method checkBindStatus');
    bindOut(ResultState.setLoading());
    _checkBindStatusUsecase
        .execute(NoParams())
        .delay(Duration(seconds: 2))
        .listen((value) => value.fold(
            (error) => bindOut(ResultState.setError(error)),
            (values) => bindOut(ResultState.setResult(values))));
  }

  dispose() {
    _bindStatusOut.close();
  }
}
