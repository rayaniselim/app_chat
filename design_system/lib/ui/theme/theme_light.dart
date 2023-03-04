import 'package:flutter/material.dart';

import '../../design_system.dart';

class ThemeLightApp {
  static final themeLight = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      ColorsExtension(
        containerLogin: ColorsAppLight.cardSenderMessageColor,
        cardRecipientMessage: ColorsAppLight.cardRecipientMessage,
        cardSenderMessage: ColorsAppLight.cardSenderMessageColor,
        cardSliverListHome: ColorsAppLight.cardChatsColor,
        containerTextFieldChat: ColorsAppLight.writeBoxColor,
        circleCamera: ColorsAppLight.iconsButtonChatTextFieldColor,
      ),
    ],
    scaffoldBackgroundColor: ColorsAppLight.primary,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsAppLight.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyles.textSemiBoldTitleAppBar.copyWith(
          color: ColorsAppLight.prefixIconColor,
        ),
        iconTheme: IconThemeData(
          color: ColorsAppLight.secondary,
        )),
    iconTheme: IconThemeData(
      color: ColorsAppLight.prefixIconColor,
    ),
    primaryIconTheme: IconThemeData(
      color: ColorsAppLight.prefixIconColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
          ColorsAppLight.cardRecipientMessage,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    primaryColor: ColorsAppLight.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsAppLight.primary,
      primary: ColorsAppLight.primary,
      secondary: ColorsAppLight.secondary,
    ),
    cardColor: ColorsAppLight.cardChatsColor,
    backgroundColor: ColorsAppLight.primary,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textMediumRecent,
      labelStyle: TextStyles.textMediumRecent,
      //////

      fillColor: ColorsAppLight.writeBoxColor,
      prefixIconColor: ColorsAppLight.prefixIconColor,
      suffixIconColor: ColorsAppLight.iconsButtonChatTextFieldColor,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      errorStyle: TextStyles.textMediumRecent.copyWith(
        color: ColorsAppLight.errorColor,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsAppLight.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsAppLight.errorColor,
        ),
      ),
    ),
  );
}
