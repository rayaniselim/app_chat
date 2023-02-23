// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_chat/core/presenter/page/home_page.dart';

import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class LoginPage extends StatefulWidget {
  final bool isLightTheme;
  final void Function() toggleTheme;
  final Color colorRecent;

  const LoginPage({
    Key? key,
    required this.isLightTheme,
    required this.toggleTheme,
    required this.colorRecent,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sizedBox = const SizedBox(height: 20);
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorsExtension colorsExtension =
        Theme.of(context).extension<ColorsExtension>()!;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: colorsExtension.containerLogin,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: size.width * 0.8,
                height: size.height * 0.35,
                padding: EdgeInsets.only(
                  left: size.width * 0.07, //30,
                  right: size.width * 0.07, //30,
                  top: size.width * 0.07, //30,
                  bottom: size.width * 0.05, //20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWdiget(
                      hintText: 'Email',
                      icon: Icon(
                        (Icons.email_outlined),
                        size: size.height * 0.024,
                      ),
                      isObscure: false,
                      initialValue: 'rayani@user.com',
                      keyboardType: TextInputType.emailAddress,
                      labelText: '',
                    ),
                    sizedBox,
                    TextFieldWdiget(
                      hintText: 'Password',
                      isObscure: isObscure,
                      initialValue: '123456',
                      icon: GestureDetector(
                        child: isObscure == true
                            ? Icon(
                                Icons.visibility_off_outlined,
                                size: size.height * 0.024,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                size: size.height * 0.024,
                              ),
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
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
                          MaterialPageRoute(
                            builder: (_) => HomePage(
                              toggleTheme: widget.toggleTheme,
                              isLightTheme: widget.isLightTheme,
                              colorRecent: widget.colorRecent,
                            ),
                          ),
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
