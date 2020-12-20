import 'package:clean_architect/features/data/datasource/binding/cache/binding_cache.dart';
import 'package:clean_architect/features/di/injection_container.dart' as di;
import 'package:clean_architect/features/presentation/components/utility/app_theme.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:clean_architect/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

//NOTE apps
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      title: "Clean Architecture",
      debugShowCheckedModeBanner: true,
      navigatorObservers: [routeObserver],
      theme: createTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: LoginScreen.route, page: () => LoginScreen()),
        GetPage(name: HomeScreen.route, page: () => HomeScreen()),
      ],
    );
  }
}
