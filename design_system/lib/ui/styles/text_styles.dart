import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle get textLigth => const TextStyle(
        fontWeight: FontWeight.w300,
        // fontFamily: font,
      );
  static TextStyle get textRegular => const TextStyle(
        fontWeight: FontWeight.normal,
        // fontFamily: font,
      );
  static TextStyle get textMedum => const TextStyle(
        fontWeight: FontWeight.w500,
        // fontFamily: font,
      );
  static TextStyle get textSemiBold => const TextStyle(
        fontWeight: FontWeight.w600,
        // fontFamily: font,
      );
  static TextStyle get textBold => const TextStyle(
        fontWeight: FontWeight.bold, // w700
        // fontFamily: font,
      );
  static TextStyle get textExtraBold => const TextStyle(
        fontWeight: FontWeight.w800,
        // fontFamily: font,
      );

  static TextStyle get textButtonLabel => textBold.copyWith(
        fontSize: 14,
      );
}
