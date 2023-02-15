import 'package:flutter/material.dart';
import '../../design_system.dart';

class ThemeApp {
  static final themeDark = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      ColorsExtension(
        containerLogin: ColorsApp.cardSenderMessageColorDark,
        cardRecipientMessage: ColorsApp.cardRecipientMessageDark,
        cardSenderMessage: ColorsApp.cardSenderMessageColorDark,
        cardSliverListHome: ColorsApp.cardChatsColorDark,
        containerTextFieldChat: ColorsApp.writeBoxColorDark,
        circleCamera: ColorsApp.iconsButtonChatTextFieldColorDark,
      ),
    ],
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          ColorsApp.cardSenderMessageColorDark,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    primaryColor: ColorsApp.primaryDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.primaryDark,
      primary: ColorsApp.primaryDark,
      secondary: ColorsApp.secondaryDark,
    ),
    cardColor: ColorsApp.cardChatsColorDark,
    backgroundColor: ColorsApp.primaryDark,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.writeBoxColorDark,
      hintStyle: TextStyles.textMediumRecent,
      labelStyle: TextStyles.textMediumRecent,
      prefixIconColor: ColorsApp.prefixIconColorDark,
      suffixIconColor: ColorsApp.iconsButtonChatTextFieldColorDark,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      errorStyle: TextStyles.textMediumRecent.copyWith(
        color: ColorsApp.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsApp.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsApp.errorColor,
        ),
      ),
    ),
  );
////////////////////////////////////////////////////////////////
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
      fillColor: Colors.red, // cor fundo do textfield
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      errorStyle: TextStyles.textMediumRecent.copyWith(
        color: ColorsApp.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsApp.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsApp.errorColor,
        ),
      ),
    ),

    // ThemeExtension();
  );
}
