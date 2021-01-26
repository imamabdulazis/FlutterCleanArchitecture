import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/env/config.dart';
import 'core/env/flavor.dart';
import 'features/di/injection_container.dart' as di;
import 'features/presentation/components/utility/app_theme.dart';
import 'features/presentation/screens/home/home_screen.dart';
import 'features/presentation/screens/login/login_screen.dart';
import 'features/presentation/screens/splash/splash_screen.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await getFlavorSetting();
    await di.init();
    runApp(App());
    final settings = Config.getInstance();
    print('🚀 APP_FLAVOR_NAME      : ${settings.flavorName}');
    print('🚀 APP_API_BASE_URL     : ${settings.apiBaseUrl}');
    print('🚀 APP_API_SENTRY       : ${settings.apiSentry}');

    ///[Catch some error]
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (!kReleaseMode) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        FlutterError.dumpErrorToConsole(details);
      }
    };
  } catch (error, stackTrace) {
    print("-->ERROR $error");
    print("-->STACKTRACE $stackTrace");
  }
}

Future<FlavorSettings> getFlavorSetting() async {
  String flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');

  if (flavor == 'development') {
    return FlavorSettings.development();
  } else if (flavor == 'staging') {
    return FlavorSettings.staging();
  } else if (flavor == 'production') {
    return FlavorSettings.production();
  } else {
    throw Exception("Oopss... Flavor name missing");
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: 'Facebook',
      debugShowCheckedModeBanner: true,
      navigatorObservers: <NavigatorObserver>[routeObserver],
      theme: createTheme(),
      initialRoute: '/',
      getPages: <GetPage>[
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: LoginScreen.route, page: () => LoginScreen()),
        GetPage(name: HomeScreen.route, page: () => HomeScreen()),
      ],
    );
  }
}
