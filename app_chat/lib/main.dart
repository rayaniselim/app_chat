import 'package:app_chat/page_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/modules/chat_module/presenter/page/chat_page.dart';
import 'app/modules/login_module/presenter/page/login_page.dart';
import 'firebase_options.dart';
import 'app/modules/home_module/presenter/page/home_page.dart';
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
  void toggleTheme() {
    bool isLightTheme = true;
    setState(() => isLightTheme = !isLightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      // home: const PageWidgetbook(),
      // home: const HomePage(),
      home: const LoginPage(),
      // home: const PageColors(),
    );
  }
}
