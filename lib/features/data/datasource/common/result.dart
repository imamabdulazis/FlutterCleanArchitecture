import '../../../../core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class ResultState<Type> extends Equatable {
  const ResultState({this.state, this.data, this.error});

  factory ResultState.setLoading() {
    return const ResultState(state: CurrentState.LOADING);
  }

  factory ResultState.setResult(Type data) {
    return ResultState(state: CurrentState.SUCCESS, data: data);
  }

  factory ResultState.setError(Failure error) {
    return ResultState(state: CurrentState.ERROR, error: error);
  }

  final CurrentState? state;
  final Type? data;
  final Failure? error;

  @override
  List<Object> get props => [state!, data!, error!];
}

enum CurrentState { LOADING, SUCCESS, ERROR }
