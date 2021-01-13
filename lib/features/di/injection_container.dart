import 'package:clean_architect/core/network/http_client.dart';
import 'package:clean_architect/core/network/network_info.dart';
import 'package:clean_architect/features/presentation/blocs/sign_bloc.dart';
import 'package:clean_architect/features/presentation/components/utility/input_converter.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:clean_architect/features/data/datasource/binding/local/binding_local.dart';
import 'package:clean_architect/features/data/datasource/binding/remote/binding_remote.dart';
import 'package:clean_architect/features/data/datasource/datasource_factory.dart';
import 'package:clean_architect/features/data/repositories/user_repository_impl.dart';
import 'package:clean_architect/features/domain/repositories/user_repository.dart';
import 'package:clean_architect/features/domain/usecases/binding_usecase.dart';
import 'package:clean_architect/features/domain/usecases/sign_email_usecase.dart';
import 'package:clean_architect/features/presentation/blocs/initial_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

//NOTE : input for global data state
final sl = GetIt.instance;

const base_url = "sample_base_url";

Future<void> init() async {
  SharedPrefs prefs = await SharedPrefs.getInstance();

  //network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerSingleton(
    HttpClient(base_url),
  );

  //data
  sl.registerLazySingleton(() => prefs);
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///  bloc
  sl.registerFactory(() => InitialBloc(sl()));
  sl.registerFactory(() => SignBloc());

  //Use cases
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => SignEmailAccountUsecase(sl()));

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
