import 'package:clean_architect/features/data/datasource/common/result.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/blocs/initial_bloc.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:clean_architect/main/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookWidget {
  static const String route = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = sl<InitialBloc>();

    useEffect(() {
      return bloc.checkBindStatus();
    }, const []);

    print('build splash screen');
    bloc.bindStatusStream.listen((event) {
      print('listen ${event.data}');
      print(event);
      if (event.state == CurrentState.SUCCESS) {
        if (!event.data) {
          Get.toNamed(LoginScreen.route);
        } else {
          Get.toNamed(HomeScreen.route);
        }
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/animation/splash.json',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
