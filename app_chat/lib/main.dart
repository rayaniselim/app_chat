import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );

  // User? userFirebase = FirebaseAuth.instance.currentUser;
//   FirebaseFirestore.instance
//       .collection('User')
//       .doc()
//       .set({'id': '01', 'name': 'rayani'});
}
