import 'package:flutter/material.dart';
import '../styles/colors_app.dart';

class ThemeApp {
  static final themeDark = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primaryDark,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsApp.primaryDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsApp.secondaryDark,
        )),
    iconTheme: IconThemeData(
      color: ColorsApp.prefixIconColorDark,
    ),
    primaryIconTheme: IconThemeData(
      color: ColorsApp.prefixIconColorDark,
    ),

    primaryColor: ColorsApp.primaryDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink, //ColorsApp.primaryDark,
      primary: ColorsApp.primaryDark,
      secondary: ColorsApp.secondaryDark,
    ),
    cardColor: ColorsApp.cardChatsColorDark,
    backgroundColor: ColorsApp.primaryDark,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsApp.prefixIconColorDark,
      suffixIconColor: ColorsApp.iconsButtonChatTextFieldColorDark,
      fillColor: Colors.red,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: const BorderSide(
      //     // color: ColorsApp.primaryDark, // TODO: VERIFICAR O TEMA
      //     width: 0.5,
      //   ),
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
    ),
    // errorStyle: TextStyles.textRegular.copyWith(
    // color: Colors.redAccent,
    // ),
  );

  static final themeLight = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primaryLight,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsApp.primaryLight,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsApp.secondaryLight,
        )),
    iconTheme: IconThemeData(
      color: ColorsApp.prefixIconColorLight,
    ),
    primaryIconTheme: IconThemeData(
      color: ColorsApp.prefixIconColorLight,
    ),

    primaryColor: ColorsApp.primaryLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink, //ColorsApp.primaryLight,
      primary: ColorsApp.primaryLight,
      secondary: ColorsApp.secondaryLight,
    ),
    cardColor: ColorsApp.cardChatsColorLight,
    backgroundColor: ColorsApp.primaryLight,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsApp.prefixIconColorLight,
      suffixIconColor: ColorsApp.iconsButtonChatTextFieldColorLight,
      fillColor: Colors.red,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
    ),
    // errorStyle: TextStyles.textRegular.copyWith(
    // color: Colors.redAccent,
    // ),
  );
}
