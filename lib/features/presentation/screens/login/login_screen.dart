import 'package:clean_architect/core/helper/helper.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/binding_cache.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/constants.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/components/module/headline1.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/email_input.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/input_password.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/login_button.dart';
import 'package:clean_architect/main/main.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends HookWidget {
  static const String route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPrefs>();

    useEffect(() {
      print("Login Screen");
      return;
    }, const []);

    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Headline1(text: R.string.login),
                    InputEmail(),
                    InputPassword(),
                    const SizedBox(height: 20),
                    LoginButton(
                      title: "YUHUU",
                      onPressed: () {
                        prefs.putString(Constants.accessToken, "LOGIN");
                        Get.toNamed(HomeScreen.route);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
