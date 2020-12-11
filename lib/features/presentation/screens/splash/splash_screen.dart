import 'package:clean_architect/core/utils/result_state.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/blocs/initial_bloc.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  static const String route = 'SplashScreen';

  InitialBloc bloc = sl<InitialBloc>();

  @override
  Widget build(BuildContext context) {
    // NOTE : show splash screen
    print('build splash screen');
    bloc.bindStatusStream.listen((event) {
      print('listen');
      if (event.state == CurrentState.SUCCESS) {
        if (!event.data) {
          Navigator.pushReplacementNamed(context, LoginScreen.route);
        } else {
          Navigator.pushReplacementNamed(context, HomeScreen.route);
        }
      }
    });
    return Scaffold(
      body: Center(
        child: Text("SPASH SCREEN"),
      ),
    );
  }
}

