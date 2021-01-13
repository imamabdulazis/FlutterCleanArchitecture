import 'package:clean_architect/features/data/datasource/binding/cache/dummy.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/constants.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:clean_architect/features/presentation/components/widget/button_circle.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/app_bar_home.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/post_widget.dart';
import 'package:clean_architect/features/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      body: CustomScrollView(
        slivers:<Widget> [
          AppBarHome(),
          PostWidget(currentUser: currentUser),
        ],
      ),
    );
  }
}
