import '../../common/constants/prefs_constants.dart';
import '../../data/datasource/binding/cache/shared_prefs.dart';
import '../../di/InjectionContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeCubit extends Cubit<ThemeMode> {
  ChangeThemeCubit() : super(ThemeMode.system);

  final SharedPref? themeMode = sl<SharedPref>();

  void changeTheme() {
    bool? isDarkMode = themeMode!.getBool(Constants.keyTheme);
    if (isDarkMode!) {
      emit(ThemeMode.dark);
    } else if (!isDarkMode) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.system);
    }
  }
}
