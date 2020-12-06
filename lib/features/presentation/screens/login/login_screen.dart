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
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text("YHUUu"),
        ),
      ),
    );
  }
}
