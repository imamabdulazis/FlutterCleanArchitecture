import 'package:clean_architect/features/di/injection_container.dart' as di;
import 'package:clean_architect/features/presentation/screens/splash/splash_screen.dart';
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
      title: "Clean",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      home: SplashScreen(),
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
        child: Text("sdf"),
      ),
    );
  }
}
