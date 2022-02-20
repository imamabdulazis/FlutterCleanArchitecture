import 'package:clean_architect/core/error/failure.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/shared_prefs.dart';
import 'package:clean_architect/features/data/datasource/common/base_datasource_factory.dart';
import 'package:clean_architect/features/data/datasource/datasource_factory.dart';
import 'package:clean_architect/features/di/InjectionContainer.dart';
import 'package:clean_architect/features/domain/repositories/AppRepository.dart';
import 'package:dartz/dartz.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl({
    required BindingDataSourceFactory? bindingDataSourceFactory,
  }) : _bindingDataSourceFactory = bindingDataSourceFactory;

  final BindingDataSourceFactory? _bindingDataSourceFactory;

  final pref = sl<SharedPref>();

  @override
  Stream<Either<Failure, String>> getPreferredLanguage() {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .getPreferredLanguage()
        .map((event) => Right(event!));
  }

  @override
  Stream<Either<Failure, void>> updatePreferredLanguage(String code) {
    return _bindingDataSourceFactory!
        .createData(DataSourceState.local)!
        .updatePreferredLanguage(code)
        .map((event) => Right(event));
  }
}
