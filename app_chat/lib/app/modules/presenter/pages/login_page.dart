import 'package:app_chat/app/modules/presenter/pages/home_page.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sizedBox = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                color: ColorsApp.yourMessageContainerColor,
                width: width * 0.8,
                height: height * 0.28,
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFieldLoginWdiget(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      labelText: 'Email',
                      icon: (Icons.email_outlined),
                      obscure: false,
                    ),
                    sizedBox,
                    const TextFieldLoginWdiget(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Password',
                      labelText: 'Password',
                      icon: (Icons.lock_outline),
                      obscure: true,
                    ),
                    sizedBox,
                    ButtonLoginWidget(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
