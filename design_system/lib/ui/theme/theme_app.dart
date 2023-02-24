import '../../design_system.dart';

class ThemeApp {
  final bool isLightTheme;
  ThemeApp({
    required this.isLightTheme,
  });

  factory ThemeApp.initState() {
    return ThemeApp(isLightTheme: true);
  }

  static final themeDark = ThemeDarkApp.themeDark;

  static final themeLight = ThemeLightApp.themeLight;
}
