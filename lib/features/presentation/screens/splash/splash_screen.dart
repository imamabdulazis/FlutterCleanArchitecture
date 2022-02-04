import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/common/result.dart';
import '../../../di/InjectionContainer.dart';
import '../../blocs/initial_bloc.dart';
import '../login/login_screen.dart';
import '../navigation/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bloc = sl<SplashBloc>();

  @override
  void initState() {
    bloc.bindStatusStream.listen((event) {
      print('build splash screen');
      print('listen ${event.data}');
      print(event);
      if (event.state == CurrentState.SUCCESS) {
        if (event.data != null) {
          Get.offAndToNamed(LoginScreen.route);
        } else {
          Get.off(BottomNavScreen());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text('From', style: Theme.of(context).textTheme.button),
                  SizedBox(
                    child: Image.asset(
                      'assets/img/meta.png',
                      width: 50,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
