import 'package:clean_architect/features/presentation/components/utility/app_theme.dart';
import 'package:clean_architect/features/presentation/screens/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'features/common/constants/prefs_constants.dart';
import 'features/data/datasource/binding/cache/shared_prefs.dart';
import 'features/di/InjectionContainer.dart';
import 'features/presentation/screens/home/home_screen.dart';
import 'features/presentation/screens/login/login_screen.dart';
import 'features/presentation/screens/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final SharedPrefs prefs = sl<SharedPrefs>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    bool? isDarkMode = prefs.getBool(Constants.keyTheme);
    bool isLogged = prefs.isKeyExists(Constants.keyUserLoggedIn);

    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      navigatorObservers: <NavigatorObserver>[routeObserver],
      theme: CreateTheme.lightTheme,
      darkTheme: CreateTheme.darkTheme,
      themeMode: isDarkMode == null
          ? ThemeMode.system
          : isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
      initialRoute: isLogged ? BottomNavScreen.route : BottomNavScreen.route,
      getPages: <GetPage>[
        GetPage(name: SplashScreen.route, page: () => SplashScreen()),
        GetPage(name: LoginScreen.route, page: () => LoginScreen()),
        GetPage(name: BottomNavScreen.route, page: () => BottomNavScreen()),
      ],
    );
  }
}
