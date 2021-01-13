import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/constants.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/components/helper/helper.dart';
import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:clean_architect/features/presentation/components/widget/button_contain.dart';
import 'package:clean_architect/features/presentation/components/widget/headline1.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/email_input.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/header.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/input_password.dart';
import 'package:clean_architect/features/presentation/screens/login/local_widget/login_button.dart';
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderLogin(),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    InputEmail(),
                    InputPassword(),
                    const SizedBox(height: 20),
                    ButtonContain(
                      title: 'Login',
                      buttonColors: Palette.facebookBlue,
                      titleColors: Colors.white,
                      onPressed: () {
                        prefs.putString(Constants.accessToken, 'login');
                        Get.toNamed(HomeScreen.route);
                      },
                    ),
                    const SizedBox(height: 20),
                    const InkWell(
                      child: Text(
                        'Forgot password',
                        style: TextStyle(color: Palette.facebookBlue),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ButtonContain(
                      title: 'Create new Account facebook',
                      buttonColors: Colors.green,
                      titleColors: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
