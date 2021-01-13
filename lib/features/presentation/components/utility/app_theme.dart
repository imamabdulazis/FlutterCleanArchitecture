import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:flutter/material.dart';

ThemeData createTheme() {
  const Color primaryColor = Palette.facebookBlue;
  const Color primaryColorDark = Palette.facebookBlue;
  const Color primaryColorLight = Palette.facebookBlue;
  const Color secondaryColor = Palette.facebookBlue;
  const Color secondaryColorDark = Palette.facebookBlue;
  final Color disabledColor = Colors.grey[400];
  const Color dividerColor = Colors.grey;
  const TextTheme textTheme = TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark));
  const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColorLight)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      alignLabelWithHint: true);
  final ButtonThemeData buttonTheme = ButtonThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      highlightColor: secondaryColor,
      secondaryHeaderColor: secondaryColorDark,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonTheme);
}
