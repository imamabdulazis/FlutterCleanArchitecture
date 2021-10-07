import 'dart:ui';

import 'package:clean_architect/features/presentation/components/helper/helper.dart';

import 'string/translation.dart';

class R {
  static Translation string = ID();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = ID();
        break;
    }
  }
}
