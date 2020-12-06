import 'package:clean_architect/features/di/injection_container.dart' as di;
import 'package:clean_architect/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

//NOTE apps
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clean Architecture",
      home: SplashScreen(),
    );
  }
}
