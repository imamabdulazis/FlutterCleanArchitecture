import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/common/result.dart';
import '../../../di/injection_container.dart';
import '../../blocs/initial_bloc.dart';
import '../login/login_screen.dart';
import '../navigation/navigation.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/SplashScreen';

  @override
  Widget build(BuildContext context) {
    final bloc = sl<SplashBloc>();

    print('build splash screen');
    bloc.bindStatusStream.listen((event) {
      print('listen ${event.data}');
      print(event);
      if (event.state == CurrentState.SUCCESS) {
        if (event.data != null) {
          Get.offNamed(LoginScreen.route);
        } else {
          Get.off(NavScreen());
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 40),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/img/logo.png',
                width: Get.width / 5,
                height: Get.height / 5,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Facebook',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
