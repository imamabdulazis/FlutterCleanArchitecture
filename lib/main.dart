import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/env/config.dart';
import 'core/env/flavor.dart';
import 'features/di/InjectionContainer.dart' as di;
import 'features/presentation/components/utility/observer.dart';

///[get debug mode]
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  /// [Catch some error]
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  /// [run apps] with catch error
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await getFlavorSetting();
    await di.init();
    // await disableLendscapeMode(); /// [deprecated]
    disableErrorWidget();

    SystemChrome.setPreferredOrientations([]).then((_) {
      BlocOverrides.runZoned(
        () => {
          runApp(const MyApp()),
        },
        blocObserver: MyBlocObserver(),
      );
    });

    ///[console] flavor running hidden when release mode
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      print('🚀 APP FLAVOR NAME      : ${settings.flavorName}');
      print('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}');
      print('🚀 APP API_SENTRY       : ${settings.apiSentry}');
    }
  }, (error, stackTrace) {
    print('❎ ERROR OTHER   :$error');
    print('❎ STACKTRACE    :$stackTrace');
  });
}

/// [disable error] widget when [release mode]
void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      print('Error widget trigerred on :${details.exception}');
      print(details.stack.toString());
      return Container(
        child: const Center(
          child: Text('Something Goes Wrong, Please chek your debug console'),
        ),
      );
    };
  }
}

/// [disable landscape] model [deprecated] already move to runZoned
// Future<void> disableLendscapeMode() async {
//   await SystemChrome.setPreferredOrientations(([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]));
// }

///[environment] configuration
Future<FlavorSettings> getFlavorSetting() async {
  final flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');

  if (flavor == 'development') {
    return FlavorSettings.development();
  } else if (flavor == 'staging') {
    return FlavorSettings.staging();
  } else if (flavor == 'production') {
    return FlavorSettings.production();
  } else {
    throw Exception('Oopss... Flavor name missing');
  }
}
