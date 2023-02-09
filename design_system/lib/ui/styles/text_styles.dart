import 'package:design_system/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class TextStyles {
  // String get font => 'poppins';

  static TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        // fontFamily: font,
        color: ColorsApp.secondary,
      );

  static TextStyle get textSemiBoldCard => TextStyle(
        fontWeight: FontWeight.w600,
        // fontFamily: font,
        color: ColorsApp.secondaryTextColor,
      );
  static TextStyle get textSemiBoldChat => TextStyle(
        fontWeight: FontWeight.w600,
        // fontFamily: font,
        color: ColorsApp.secondary,
      );
}
