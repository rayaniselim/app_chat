import 'package:flutter/material.dart';

class ColorsApp {
  final Color color;
  ColorsApp(this.color);
  static const colorsAppDark = ColorsAppDark;
  static const colorsAppLight = ColorsAppLight;
}

class ColorsAppDark {
  static Color get errorColor => const Color(0xffB71c1c);

  static Color get primary => const Color(0xff1B202D);
  static Color get secondary => const Color(0xffFFFFFF);

  static Color get cardChatsColor => const Color(0xff292F3F);
  static Color get cardRecipientMessage => const Color(0xff7A8194);
  static Color get cardSenderMessageColor => const Color(0xff373E4E);
  static Color get writeBoxColor => const Color(0xff3D4354);
  static Color get iconsButtonChatTextFieldColor => const Color(0xff9398A7);
  static Color get secondaryTextColor => const Color(0xffB3B9C9);
  static Color get prefixIconColor => const Color(0xff000000);
}

class ColorsAppLight {
  static Color get errorColor => const Color(0xffB71c1c);

  static Color get primary => const Color(0xff7A8194);
  static Color get secondary => const Color(0xff1B202D);

  static Color get cardChatsColor =>
      const Color(0xff373E4E); // Color(0xff292F3F);

  static Color get cardRecipientMessage =>
      const Color(0xff3D4354); //0xffB3B9C9);
  static Color get cardSenderMessageColor => const Color(0xff292F3F);
  static Color get writeBoxColor => const Color(0xff3D4354);
  static Color get iconsButtonChatTextFieldColor => const Color(0xff9398A7);
  // static Color get secondaryTextColor => Colors.pink; //Color(0xffFFFFFF);

  static Color get prefixIconColor => const Color(0xff000000);
}
