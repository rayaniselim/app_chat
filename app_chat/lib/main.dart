import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/modules/login_module/presenter/page/login_page.dart';
import 'firebase_options.dart';
import 'package:design_system/design_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//   FirebaseFirestore.instance
//       .collection('User')
//       .doc()
//       .set({'id': '01', 'name': 'rayani'});
}

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
      ),
      // home: const PageColors(),
    );
  }
}
