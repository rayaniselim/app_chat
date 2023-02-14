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
                decoration: BoxDecoration(
                  color: ColorsApp.yourMessageContainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width * 0.8,
                height: height * 0.30,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFieldEmailWdiget(),
                    sizedBox,
                    const TextFieldPasswordWdiget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ForgotMyPasswordWidget(),
                        ButtonRegisterWidget(),
                      ],
                    ),
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
