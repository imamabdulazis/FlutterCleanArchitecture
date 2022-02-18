import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/utility/palette.dart';
import '../../components/widget/button_contain.dart';
import '../home/home_screen.dart';
import 'local_widget/email_input.dart';
import 'local_widget/header.dart';
import 'local_widget/input_password.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "/LoginScreen";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderLogin(),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    InputEmail(),
                    const SizedBox(height: 10),
                    InputPassword(),
                    const SizedBox(height: 20),
                    ButtonContain(
                      title: 'Login',
                      buttonColors: Palette.facebookBlue,
                      titleColors: Colors.white,
                      onPressed: () {
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
