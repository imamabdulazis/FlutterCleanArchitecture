import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/language_constants.dart';

class AppLocalizations {
  final Locale _locale;

  AppLocalizations(
    this._locale, {
    this.isTest = false,
  });

  bool isTest;

  static AppLocalizations? of(context) =>
      Localizations.of(context, AppLocalizations);

  late Map<String, String> _localizedStrings;

  /// * load localization to test mode
  ///
  Future<AppLocalizations> loadTest(Locale locale) async {
    return AppLocalizations(locale);
  }

  /// * load localization to production mode
  ///
  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString('assets/i18n/${_locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String? translate(String key) {
    if (isTest) return key;

    return _localizedStrings[key];
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationDelegate();
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate({
    this.isTest = false,
  });

  final bool isTest;

  @override
  bool isSupported(Locale locale) {
    return Languages.languages
        .map((e) => e.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale, isTest: isTest);
    if (isTest) {
      await localizations.loadTest(locale);
    } else {
      await localizations.load();
    }
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
