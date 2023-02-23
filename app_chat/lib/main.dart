import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  // runApp(
  //   ModularApp(module: AppModule(), child: const AppWidget()),
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // User? userFirebase = FirebaseAuth.instance.currentUser;
//   FirebaseFirestore.instance
//       .collection('User')
//       .doc()
//       .set({'id': '01', 'name': 'rayani'});
}
