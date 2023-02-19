import 'package:flutter/material.dart';

import '../../design_system.dart';

class ThemeDarkApp {
  static final themeDark = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      ColorsExtension(
        containerLogin: ColorsAppDark.cardSenderMessageColor,
        cardRecipientMessage: ColorsAppDark.cardRecipientMessage,
        cardSenderMessage: ColorsAppDark.cardSenderMessageColor,
        cardSliverListHome: ColorsAppDark.cardChatsColor,
        containerTextFieldChat: ColorsAppDark.writeBoxColor,
        circleCamera: ColorsAppDark.iconsButtonChatTextFieldColor,
      ),
    ],
    scaffoldBackgroundColor: ColorsAppDark.primary,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsAppDark.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorsAppDark.secondary,
        ),
        iconTheme: IconThemeData(
          color: ColorsAppDark.secondary,
        )),
    iconTheme: IconThemeData(
      color: ColorsAppDark.prefixIconColor,
    ),
    primaryIconTheme: IconThemeData(
      color: ColorsAppDark.prefixIconColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          ColorsAppDark.cardRecipientMessage,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    primaryColor: ColorsAppDark.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsAppDark.primary,
      primary: ColorsAppDark.primary,
      secondary: ColorsAppDark.secondary,
    ),
    cardColor: ColorsAppDark.cardChatsColor,
    backgroundColor: ColorsAppDark.primary,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textMediumRecent,
      labelStyle: TextStyles.textMediumRecent,
      fillColor: ColorsAppDark.writeBoxColor,
      prefixIconColor: ColorsAppDark.prefixIconColor,
      suffixIconColor: ColorsAppDark.iconsButtonChatTextFieldColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      errorStyle: TextStyles.textMediumRecent.copyWith(
        color: ColorsAppDark.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsAppDark.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsAppDark.errorColor,
        ),
      ),
    ),
  );
}
