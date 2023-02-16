// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:design_system/ui/styles/colors_app.dart';

class TextStyles {
  final Color colorTitle;

  TextStyles(
    this.colorTitle,
  );

  static TextStyle get textRegularMessageChat => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsAppDark.secondary,
        fontSize: 14,
      );

  static TextStyle get textRegularMessageCard => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsAppDark.secondaryTextColor,
        fontSize: 14,
      );
  static TextStyle get textRegularDateChat => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsAppDark.secondary,
        fontSize: 12,
      );
  static TextStyle get textRegularNameStories => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsAppDark.secondary,
        fontSize: 16,
      );

  static TextStyle get textMediumRecent => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: ColorsAppDark.secondary.withOpacity(0.58),
        fontSize: 13,
      );
  static TextStyle get textRegularCardMessageChat => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: ColorsAppDark.secondary.withOpacity(0.45),
        fontSize: 13,
      );

  static TextStyle get textSemiBoldTitles => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: ColorsAppDark.secondary,
      );
  static TextStyle get textSemiBoldTitleAppBar => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
      );
}
