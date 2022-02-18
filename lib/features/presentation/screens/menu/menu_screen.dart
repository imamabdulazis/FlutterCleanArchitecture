import 'package:clean_architect/features/common/constants/prefs_constants.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/shared_prefs.dart';
import 'package:clean_architect/features/di/InjectionContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final SharedPrefs? prefs = sl<SharedPrefs>();

  bool isDark = Get.isDarkMode;

  void switchTheme(bool _) {
    setState(() => isDark = _);
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      prefs!.putBool(Constants.keyTheme, false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      prefs!.putBool(Constants.keyTheme, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Container(
          child: ListTile(
            title: Text("Theme"),
            trailing: CupertinoSwitch(
              key: const Key("changeTheme"),
              value: isDark,
              onChanged: switchTheme,
            ),
          ),
        ),
      ),
    );
  }
}
