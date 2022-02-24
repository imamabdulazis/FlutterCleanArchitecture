import 'package:clean_architect/features/common/constants/language_constants.dart';
import 'package:clean_architect/features/common/localization/localization.dart';
import 'package:clean_architect/features/presentation/blocs/LanguageBloc.dart';
import 'package:clean_architect/features/presentation/components/utility/app_theme.dart';
import 'package:clean_architect/features/presentation/screens/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'features/common/constants/prefs_constants.dart';
import 'features/data/datasource/binding/cache/shared_prefs.dart';
import 'features/di/InjectionContainer.dart';
import 'features/presentation/screens/login/login_screen.dart';
import 'features/presentation/screens/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final SharedPref pref = sl<SharedPref>();
  late final LanguageBloc _languageBloc = sl<LanguageBloc>();
  final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

  @override
  void initState() {
    _languageBloc.add(LoadPreferredLanguageEvent());
    super.initState();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final bool? isDarkMode = pref.getBool(Constants.keyTheme);
    final bool isLogged = pref.isKeyExists(Constants.keyUserLoggedIn);

    return BlocProvider(
        create: (context) => _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: true,
                navigatorObservers: <NavigatorObserver>[routeObserver],

                ///THEME CONFIGURATION
                theme: CreateTheme.lightTheme,
                darkTheme: CreateTheme.darkTheme,
                themeMode: isDarkMode == null
                    ? ThemeMode.system
                    : isDarkMode
                        ? ThemeMode.dark
                        : ThemeMode.light,

                ///END THEME CONFIGURATION
                ///
                ///ROUTING
                navigatorKey: _navigatorKey,
                initialRoute:
                    isLogged ? BottomNavScreen.route : BottomNavScreen.route,
                getPages: <GetPage>[
                  GetPage(name: SplashScreen.route, page: () => SplashScreen()),
                  GetPage(name: LoginScreen.route, page: () => LoginScreen()),
                  GetPage(
                      name: BottomNavScreen.route,
                      page: () => BottomNavScreen()),
                ],

                ///END ROUTING
                ///
                /// LOCALIZATION
                /// will reset if we don't save to local storage
                locale: Get.locale,
                supportedLocales: Languages.languages
                    .map(
                      (e) => Locale(e.code!),
                    )
                    .toList(),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],

                ///END LOCALIZATION
                //noted: if need custom snackbar or other
                builder: (context, child) {
                  return child!;
                },
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
