import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      print("Test use Effect");
      return;
    }, const []);

    //
    return Scaffold(
      body: Center(
        child: Text("HOME"),
      ),
    );
  }
}
