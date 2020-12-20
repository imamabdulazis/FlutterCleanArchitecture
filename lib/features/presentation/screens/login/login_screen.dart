import 'package:clean_architect/core/helper/helper.dart';
import 'package:clean_architect/features/presentation/components/module/headline1.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/email_input.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/input_password.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class LoginScreen extends HookWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {

    useEffect(() {
      print("Login Screen");
      return;
    }, const []);

    return GestureDetector(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Headline1(text: R.string.login),
                InputEmail(),
                InputPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
