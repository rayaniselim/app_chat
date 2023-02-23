import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool isLightTheme = true;

  void toggleTheme() {
    setState(() => isLightTheme = !isLightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      // home: LoginPage(
      //   isLightTheme: isLightTheme,
      //   toggleTheme: toggleTheme,
      //   colorRecent: isLightTheme
      //       ? ColorsAppLight.secondary
      //       : ColorsAppDark.secondary.withOpacity(0.58),
      // ),
    );
  }
}
