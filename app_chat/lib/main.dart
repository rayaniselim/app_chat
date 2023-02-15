import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeDark,
      // home: const PageWidgetbook(),
      // home: const HomePage(),
      // home: ChatPage(),
      home: const LoginPage(),
    );
  }
}
