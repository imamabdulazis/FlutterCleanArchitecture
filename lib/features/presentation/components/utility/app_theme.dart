import 'typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'palette.dart';

class CreateTheme {
  CreateTheme._();

  static const appbarTHeme = AppBarTheme(
    elevation: 0.0,
    brightness: Brightness.dark,
  );

  // static const textTheme = TextTheme(
  //   headline1: TextStyle(
  //     fontSize: 30,
  //     fontWeight: FontWeight.bold,
  //     color: Colors.white,
  //   ),
  // );
  static const textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: fontName,
      fontSize: 96,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontFamily: fontName,
      fontSize: 60,
      fontWeight: FontWeight.bold,
    ),
    headline3: MyTypography.xHugeBoldText,
    headline4: MyTypography.hugeSemiBoldText,
    headline5: MyTypography.xXlargeSemiBoldText,
    headline6: MyTypography.xlargeSemiBoldText,
    subtitle1: MyTypography.largeSemiBoldText,
    subtitle2: MyTypography.largeRegularText,
    bodyText1: MyTypography.mediumRegularText,
    bodyText2: MyTypography.smallRegularText,
    button: MyTypography.mediumMediumText,
    caption: MyTypography.smallRegularText,
    overline: MyTypography.xSmallRegularText,
  );
  static final inputDecorationTheme = InputDecorationTheme(
    // fillColor: Colors.white,
    filled: true,
    // border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    alignLabelWithHint: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 0.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 0.0),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Palette.primaryColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Palette.primaryColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(color: Palette.primaryColor),
      textStyle:
          MyTypography.mediumMediumText.copyWith(color: Palette.primaryColor),
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: fontName,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,
    disabledColor: Colors.grey,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    accentColor: Palette.primaryColor,
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appbarTHeme,
    // primaryTextTheme: primaryTextTheme,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: fontName,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,
    disabledColor: Palette.disabledColor,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    accentColor: Palette.primaryColor,
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appbarTHeme.copyWith(
        brightness: Brightness.dark, color: Colors.grey[900]),
    textTheme: textTheme,
    inputDecorationTheme:
        inputDecorationTheme.copyWith(fillColor: Colors.grey[800]),
    scaffoldBackgroundColor: Palette.primaryBackgroundDarkTheme,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.grey[850],
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );
}
