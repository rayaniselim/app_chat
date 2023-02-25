import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/presenter/theme_store.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeStore>();

    Modular.setInitialRoute('/login/loginPage');
    return ValueListenableBuilder(
      valueListenable: themeStore, // ele observa o themeApp
      builder: (context, state, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.themeLight,
          darkTheme: ThemeApp.themeDark,
          themeMode: state.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
