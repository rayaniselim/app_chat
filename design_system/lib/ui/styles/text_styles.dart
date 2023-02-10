import 'package:design_system/ui/styles/colors_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TextStyles {
  final double fontSize;

  TextStyles(this.fontSize);

  static TextStyle get textRegularMessageChat => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsApp.secondary,
        fontSize: 14,
      );

  static TextStyle get textRegularMessageCard => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsApp.secondaryTextColor,
        fontSize: 14,
      );
  static TextStyle get textRegularDateChat => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsApp.secondary,
        fontSize: 12,
      );
  static TextStyle get textRegularNameStories => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        color: ColorsApp.secondary,
        fontSize: 16,
      );

  static TextStyle get textMediumRecent => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: ColorsApp.secondary.withOpacity(0.58),
        fontSize: 13,
      );
  static TextStyle get textRegularCardMessageChat => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: ColorsApp.secondary.withOpacity(0.45),
        fontSize: 13,
      );

  static TextStyle get textSemiBoldTitles => GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: ColorsApp.secondary,
      );
}
