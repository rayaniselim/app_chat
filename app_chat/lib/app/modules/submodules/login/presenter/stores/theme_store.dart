import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ThemeStore extends ValueNotifier<ThemeApp> {
  ThemeStore() : super(ThemeApp.initState());
  bool get isLightTheme => value.isLightTheme;

  void toggleTheme() {
    value = ThemeApp(isLightTheme: !value.isLightTheme);
  }
}
