import '../domain/usecases/LoginUseCase.dart';
import 'package:get_it/get_it.dart';

import '../../core/env/config.dart';
import '../../core/network/http_client.dart';
import '../data/datasource/binding/cache/shared_prefs.dart';
import '../data/datasource/binding/local/binding_local.dart';
import '../data/datasource/binding/remote/binding_remote.dart';
import '../data/datasource/datasource_factory.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/UserRepository.dart';
import '../domain/usecases/CheckBindingUseCase.dart';
import '../presentation/blocs/initial_bloc.dart';
import '../presentation/blocs/sign_bloc.dart';

///[NOTE] : input for [Global] data state
final sl = GetIt.instance;

Future<void> init() async {
  final config = Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  /// [Flavor]
  /// [Implementation] flavor with different [Environm Env] both ios and android
  sl.registerLazySingleton(() => config);
  sl.registerLazySingleton(() => prefs);

  ///network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerSingleton(HttpClient(config: sl(), prefs: sl()));

  ///data [Binding]
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  ///[Core]

  ///sentry client

  ///[External]

  ///[Bloc]
  sl.registerFactory(() => SplashBloc(sl()));
  sl.registerFactory(() => SignBloc());

  ///[Usecases]
  sl.registerFactory(() => CheckBindStatusUsecase(sl()));
  sl.registerFactory(() => LoginUseCase(sl()));

  ///[Repository]
  sl.registerFactory<BindingDataSourceFactory>(
    () => BindingDataSourceFactory(bindingLocal: sl(), bindingRemote: sl()),
  );
  sl.registerFactory<UserRepository>(
    () => UserRepositoryImpl(bindingDataSourceFactory: sl()),
  );
}
