import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/data/datasource/common/result.dart';
import 'package:clean_architect/features/domain/usecases/binding_usecase.dart';
import 'package:rxdart/rxdart.dart';

class InitialBloc {
  final CheckBindStatusUsecase _checkBindStatusUsecase;

  final _bindStatusOut = BehaviorSubject<ResultState<bool>>();

  InitialBloc(this._checkBindStatusUsecase);

  Function(ResultState<bool>) get bindOut => _bindStatusOut.sink.add;

  Stream<ResultState<bool>> get bindStatusStream => _bindStatusOut.stream;

  checkBindStatus() {
    print('method checkBindStatus');
    bindOut(ResultState.setLoading());
    _checkBindStatusUsecase
        .execute(NoParams())
        .delay(Duration(milliseconds: 3000))
        .listen((event) => event.fold(
            (error) => bindOut(ResultState.setError(error)),
            (data) => bindOut(ResultState.setResult(data))));
  }

  dispose() {
    _bindStatusOut.close();
  }
}
