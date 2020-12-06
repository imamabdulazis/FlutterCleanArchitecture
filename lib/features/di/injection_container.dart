import 'package:clean_architect/core/network/network_info.dart';
import 'package:clean_architect/core/utils/input_converter.dart';
import 'package:clean_architect/features/data/datasources/binding/cache/cache_storage.dart';
import 'package:clean_architect/features/data/datasources/datasource_factory.dart';
import 'package:clean_architect/features/domain/usecases/binding_usecase.dart';
import 'package:clean_architect/features/presentation/blocs/binding_bloc.dart';
import 'package:clean_architect/features/presentation/blocs/initial_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';


//NOTE input for global data state
final sl = GetIt.instance;

Future<void> init() async {
  //network

  //service

  ///  bloc
  sl.registerFactory(() => BindingBloc());
  sl.registerFactory(() => InitialBloc(sl()));
  // sl.registerFactory(() => SignBloc());
  // sl.registerFactory(() => SocialBloc());

  //Use cases
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => BindToEmailAccountUsecase(sl()));
  sl.registerFactory(() => BindToSocialAccountUsecase(sl()));

  //Repository
  sl.registerFactory<BindingDataSourceFactory>(
      () => BindingDataSourceFactory(bindingApi: sl(), cacheApi: sl()));

  // sl.registerFactory<UserRepository>(
  //     () => UserRepositoryImpl(bindingDataSourceFactory: sl()));

  //Data source
  sl.registerFactory(() => SharePreferenceManager());

  //!Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InputConverter());

  //!external
  sl.registerLazySingleton(() => DataConnectionChecker());
}
