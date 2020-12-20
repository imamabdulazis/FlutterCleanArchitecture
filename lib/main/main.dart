import 'package:clean_architect/core/helper/helper.dart';
import 'package:clean_architect/features/di/injection_container.dart' as di;
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen_factory.dart';
import 'package:clean_architect/features/presentation/screens/splash/splash_screen.dart';
import 'package:clean_architect/features/presentation/screens/splash/splash_screen_factory.dart';
import 'package:clean_architect/main/main_screen_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashScreen),
        GetPage(name: LoginScreen.route, page: makeLoginScreen),
        GetPage(name: Main.route, page: makeMainScreen),
      ],
    );
  }
}

//NOTE : navigation
class Main extends StatelessWidget {
  static const String route = "Main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("BERHASIL LOGIN"),
      ),
    );
  }
}
