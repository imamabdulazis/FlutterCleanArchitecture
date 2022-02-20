import 'package:clean_architect/features/common/constants/language_constants.dart';
import 'package:clean_architect/features/common/constants/prefs_constants.dart';
import 'package:clean_architect/features/common/constants/translation_constants.dart';
import 'package:clean_architect/features/common/extensions/string_extensions.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/shared_prefs.dart';
import 'package:clean_architect/features/di/InjectionContainer.dart';
import 'package:clean_architect/features/domain/entities/language/LanguageEntity.dart';
import 'package:clean_architect/features/presentation/blocs/LanguageBloc.dart';
import 'package:clean_architect/features/presentation/components/widget/bottomsheet_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final SharedPref? pref = sl<SharedPref>();
  final LanguageBloc languageBloc = sl<LanguageBloc>();

  bool isDark = Get.isDarkMode;
  ValueNotifier<LanguageEntity> selectedLanguage =
      ValueNotifier(Languages.languages[0]);

  void switchTheme(bool _) {
    setState(() => isDark = _);
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      pref!.putBool(Constants.keyTheme, false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      pref!.putBool(Constants.keyTheme, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => languageBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(
                isDark ? CupertinoIcons.moon : CupertinoIcons.sun_min,
              ),
              title: Text("Dark Mode"),
              trailing: CupertinoSwitch(
                key: const Key("changeTheme"),
                value: isDark,
                onChanged: switchTheme,
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.flag),
              title: Text(R.language.translate(context)!),
              trailing: buildFlag(),
              onTap: () => showChangeLanguage(context, selectedLanguage),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFlag() {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          Image.asset(selectedLanguage.value.assets!, width: 27),
          const SizedBox(width: 10),
          Text(selectedLanguage.value.value!,
              style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    );
  }

  void showChangeLanguage(
      BuildContext context, ValueNotifier<LanguageEntity> lang) {
    Get.bottomSheet(
      BottomSheetBase(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                R.language.translate(context)!,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: Languages.languages
                  .asMap()
                  .map((i, v) => MapEntry(
                        i,
                        ListTile(
                          key: Key(v.code!),
                          onTap: () => onChangeLanguage(
                              context, ValueNotifier(i), ValueNotifier(v)),
                          leading: Image.asset(
                            v.assets!,
                            width: 30,
                          ),
                          title: Text(v.value!),
                        ),
                      ))
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: Get.isDarkMode ? Colors.grey[850]! : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  void onChangeLanguage(BuildContext context, ValueNotifier<int> index,
      ValueNotifier<LanguageEntity> lang) {
    Get.back();
    languageBloc.add(
      ToggleLanguageEvent(
        Languages.languages[index.value],
      ),
    );
    setState(() {
      selectedLanguage.value = lang.value;
    });
  }
}
