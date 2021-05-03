import 'package:flutter/material.dart';

const double xHugeText = 36;
const double hugeText = 32;
const double xXlargeText = 28;
const double xlargeText = 20;
const double largeText = 16;
const double mediumTexts = 14;
const double smallText = 12;
const double xSmallText = 10;

const String fontName = 'MaisonNeue';

class MyTypography {
  MyTypography._();

  /// todo xSmall size
  static const TextStyle xSmallLightText = TextStyle(
    fontFamily: fontName,
    fontSize: xSmallText,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle xSmallRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: xSmallText,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle xSmallMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: xSmallText,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle xSmallSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xSmallText,
    fontWeight: FontWeight.w800,
  );
  static const xSmallBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xSmallText,
    fontWeight: FontWeight.w900,
  );

  // todo small size
  static const smallLightText = TextStyle(
    fontFamily: fontName,
    fontSize: smallText,
    fontWeight: FontWeight.w300,
  );
  static const smallRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: smallText,
    fontWeight: FontWeight.w500,
  );
  static const smallMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: smallText,
    fontWeight: FontWeight.w600,
  );
  static const smallBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: smallText,
    fontWeight: FontWeight.w900,
  );

  // todo medium size
  static const mediumLightText = TextStyle(
    fontFamily: fontName,
    fontSize: mediumTexts,
    fontWeight: FontWeight.w300,
  );
  static const mediumRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: mediumTexts,
    fontWeight: FontWeight.w500,
  );
  static const mediumMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: mediumTexts,
    fontWeight: FontWeight.w600,
  );
  static const mediumSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: mediumTexts,
    fontWeight: FontWeight.w800,
  );
  static const mediumBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: mediumTexts,
    fontWeight: FontWeight.w900,
  );

  static const largeLightText = TextStyle(
    fontFamily: fontName,
    fontSize: largeText,
    fontWeight: FontWeight.w300,
  );
  static const largeRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: largeText,
    fontWeight: FontWeight.w500,
  );
  static const largeMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: largeText,
    fontWeight: FontWeight.w600,
  );
  static const largeSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: largeText,
    fontWeight: FontWeight.w800,
  );
  static const largeBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: largeText,
    fontWeight: FontWeight.w900,
  );

  // todo xlarge
  static const xlargeLightText = TextStyle(
    fontFamily: fontName,
    fontSize: xlargeText,
    fontWeight: FontWeight.w300,
  );
  static const xlargeRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: xlargeText,
    fontWeight: FontWeight.w500,
  );
  static const xlargeMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: xlargeText,
    fontWeight: FontWeight.w600,
  );
  static const xlargeSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xlargeText,
    fontWeight: FontWeight.w800,
  );
  static const xlargeBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xlargeText,
  );

  // todo xxXlarge
  static const xXlargeLightText = TextStyle(
    fontFamily: fontName,
    fontSize: xXlargeText,
    fontWeight: FontWeight.w300,
  );
  static const xXlargeRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: xXlargeText,
    fontWeight: FontWeight.w500,
  );
  static const xXlargeMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: xXlargeText,
    fontWeight: FontWeight.w600,
  );
  static const xXlargeSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xXlargeText,
    fontWeight: FontWeight.w800,
  );
  static const xXlargeBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xXlargeText,
    fontWeight: FontWeight.w900,
  );

  // todo hugeText
  static const hugeLightText = TextStyle(
    fontFamily: fontName,
    fontSize: hugeText,
    fontWeight: FontWeight.w300,
  );
  static const hugeRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: hugeText,
    fontWeight: FontWeight.w500,
  );
  static const hugeMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: hugeText,
    fontWeight: FontWeight.w600,
  );
  static const hugeSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: hugeText,
    fontWeight: FontWeight.w800,
  );
  static const hugeBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: hugeText,
    fontWeight: FontWeight.w900,
  );

  // todo xHugeText
  static const xHugeLightText = TextStyle(
    fontFamily: fontName,
    fontSize: xHugeText,
    fontWeight: FontWeight.w300,
  );
  static const xHugeRegularText = TextStyle(
    fontFamily: fontName,
    fontSize: xHugeText,
    fontWeight: FontWeight.w500,
  );
  static const xHugeMediumText = TextStyle(
    fontFamily: fontName,
    fontSize: xHugeText,
    fontWeight: FontWeight.w600,
  );
  static const xHugeSemiBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xHugeText,
    fontWeight: FontWeight.w800,
  );
  static const xHugeBoldText = TextStyle(
    fontFamily: fontName,
    fontSize: xHugeText,
    fontWeight: FontWeight.w900,
  );
}
