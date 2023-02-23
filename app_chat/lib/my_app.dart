import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app/modules/login_module/presenter/page/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;
  void toggleTheme() {
    setState(() => isLightTheme = !isLightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      darkTheme: ThemeApp.themeDark,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: LoginPage(
        isLightTheme: isLightTheme,
        toggleTheme: toggleTheme,
        colorRecent: isLightTheme
            ? ColorsAppLight.secondary
            : ColorsAppDark.secondary.withOpacity(0.58),
      ),
    );
  }
}
