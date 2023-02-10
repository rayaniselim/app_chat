import 'package:flutter/material.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class ThemeApp {
  static final themeDark = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.primary,
      elevation: 0,
      centerTitle: true,
    ),
    iconTheme: IconThemeData(
      color: ColorsApp.secondary,
    ),

    primaryColor: ColorsApp.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink, //ColorsApp.primary,
      primary: ColorsApp.primary,
      secondary: ColorsApp.secondary,
    ),
    cardColor: ColorsApp.cardChatsColor,
    backgroundColor: ColorsApp.primary,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsApp.prefixIconColor,
      suffixIconColor: ColorsApp.suffixIconColor,
      fillColor: Colors.red,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
    ),
    // errorStyle: TextStyles.textRegular.copyWith(
    // color: Colors.redAccent,
    // ),
  );

  static final themeLight = ThemeData();
}
