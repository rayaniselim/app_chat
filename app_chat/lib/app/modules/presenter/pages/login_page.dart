import 'package:app_chat/app/modules/presenter/pages/home_page.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: ColorsApp.primary,
        height: height,
        width: width,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      color: ColorsApp.yourMessageContainerColor,
                      width: width * 0.8,
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        children: [
                          const TextFieldLoginWdiget(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Email',
                            labelText: 'Email',
                            icon: (Icons.email_outlined),
                            obscure: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextFieldLoginWdiget(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Password',
                            labelText: 'Password',
                            icon: (Icons.lock_outline),
                            obscure: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonLoginWidget(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomePage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
