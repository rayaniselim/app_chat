import 'package:app_chat/app/modules/home_module/presenter/page/home_page.dart';
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
    bool isObscure = true;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsApp.yourMessageContainerColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: size.width * 0.8,
                height: size.height * 0.30,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFieldWdiget(
                      hintText: 'Email',
                      icon: Icon(
                        (Icons.email_outlined),
                      ),
                      isObscure: false,
                      initialValue: 'rayani@user.com',
                      keyboardType: TextInputType.emailAddress,
                      labelText: '',
                    ),
                    sizedBox,
                    TextFieldWdiget(
                      hintText: 'Password',
                      icon: GestureDetector(
                        //// TODO: RESOLVER O CLIQUE DO ICON
                        /// VERIFICAR O BUILDER DA PAGE
                        child: isObscure == true
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                size: 19,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                size: 19,
                              ),
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      isObscure: true,
                      initialValue: '123456',
                      keyboardType: TextInputType.none,
                      labelText: 'Password',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButtonWidget(
                          onTap: () {},
                          title: 'Register',
                        ),
                        TextButtonWidget(
                          onTap: () {},
                          title: 'Forgot my password',
                        ),
                      ],
                    ),
                    ButtonWidget(
                      title: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      width: size.width * 0.20,
                      height: size.height * 0.03,
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
