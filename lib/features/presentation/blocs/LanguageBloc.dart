import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/core/usecases/usecase.dart';
import 'package:clean_architect/features/common/constants/language_constants.dart';
import 'package:clean_architect/features/domain/entities/language/LanguageEntity.dart';
import 'package:clean_architect/features/domain/usecases/GetPreferredLanguageUseCase.dart';
import 'package:clean_architect/features/domain/usecases/UpdateLanguageUseCase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  const LanguageLoaded(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale.languageCode];
}

class LanguageError extends LanguageState {
  const LanguageError(this.message);

  final String message;
}

class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent {
  const ToggleLanguageEvent(this.language);

  final LanguageEntity? language;

  @override
  List<Object> get props => [language!.code!];
}

class LoadPreferredLanguageEvent extends LanguageEvent {}

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguageUseCase getPreferredLanguageUseCase;
  final UpdateLanguageUseCase updateLanguageUseCase;

  // ignore: sort_constructors_first
  LanguageBloc({
    required this.getPreferredLanguageUseCase,
    required this.updateLanguageUseCase,
  }) : super(LanguageLoaded(Locale(Languages.languages[1].code!))) {
    on<LanguageEvent>((event, emit) {
      if (event is ToggleLanguageEvent) {
        updateLanguageUseCase.execute(event.language!.code!).listen((event) {
          add(LoadPreferredLanguageEvent());
        });
      } else if (event is LoadPreferredLanguageEvent) {
        return emit.forEach(
          getPreferredLanguageUseCase.execute(NoParams()),
          onData: (Either<Failure, String> eventRes) {
            return eventRes.fold(
              (_) =>
                  const LanguageError('Ops, something wring with translation'),
              (values) {
                Get.updateLocale(Locale(values));
                return LanguageLoaded(Locale(values));
              },
            );
          },
        );
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

///NOTED : fold is to listen event on Asynchronous Stream [left:Error], [right:Success]
