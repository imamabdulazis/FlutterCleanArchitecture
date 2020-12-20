import 'package:clean_architect/features/data/datasource/binding/cache/binding_cache.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/constants.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class HomeScreen extends HookWidget {
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPrefs>();

    useEffect(() {
      print("Test use Effect");
      return;
    }, const []);

    //
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Center(
              child: Column(
            children: [
              Text("Selamat Datang SLURR"),
              RaisedButton(
                onPressed: () {
                  prefs.clearKey(Constants.accessToken);
                  Get.offAll(LoginScreen());
                },
                child: Text("LOGOUT"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
