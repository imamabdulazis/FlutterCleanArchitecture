import 'package:clean_architect/core/network/http_client.dart';
import 'package:clean_architect/core/network/network_info.dart';
import 'package:clean_architect/core/utils/input_converter.dart';
import 'package:clean_architect/features/data/datasources/binding/cache/binding_cache.dart';
import 'package:clean_architect/features/data/datasources/binding/local/binding_local.dart';
import 'package:clean_architect/features/data/datasources/binding/remote/binding_remote.dart';
import 'package:clean_architect/features/data/datasources/datasource_factory.dart';
import 'package:clean_architect/features/data/repositories/user_repository_impl.dart';
import 'package:clean_architect/features/domain/repositories/user_repository.dart';
import 'package:clean_architect/features/domain/usecases/binding_usecase.dart';
import 'package:clean_architect/features/presentation/blocs/initial_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//NOTE : input for global data state
final sl = GetIt.instance;

Future<void> init() async {
  //network
  sl.registerSingleton(HttpClient());

  //data
  sl.registerLazySingleton(() => BindingCache());
  sl.registerLazySingleton(() => BindingLocal());
  sl.registerFactory(() => BindingRemote(sl()));

  //service

  ///  bloc
  sl.registerFactory(() => InitialBloc(sl()));
  // sl.registerFactory(() => SignBloc());

  //Use cases
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => BindToEmailAccountUsecase(sl()));

  //Repository
  sl.registerFactory<BindingDataSourceFactory>(
      () => BindingDataSourceFactory(bindingLocal: sl(), bindingRemote: sl()));
  sl.registerFactory<UserRepository>(
      () => UserRepositoryImpl(bindingDataSourceFactory: sl()));

  //!Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InputConverter());

  //!external
  sl.registerLazySingleton(() => DataConnectionChecker());
}
