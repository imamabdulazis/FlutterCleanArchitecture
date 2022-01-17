import 'package:flutter/cupertino.dart';

import '../localization/localization.dart';

///extension for less translation string with localization
extension StringExtension on String {
  String intelliTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  String? t(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
