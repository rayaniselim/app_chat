import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/presenter/stores/theme_store.dart';
import '../../domain/entities/login_entity.dart';

class LoginPage extends StatefulWidget {
  final ThemeStore themeStore;

  const LoginPage({
    Key? key,
    required this.themeStore,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sizedBox = const SizedBox(height: 20);
  bool isObscure = true;

  final TextEditingController controllerName =
      TextEditingController(text: 'rayani');
  final TextEditingController controllerEmail =
      TextEditingController(text: 'rayani@user.com');
  final TextEditingController controllerPassword =
      TextEditingController(text: '1234567');
  FirebaseAuth auth = Modular.get<FirebaseAuth>();
  FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();

  _validarCampos() {
    String email = controllerEmail.text;
    String password = controllerPassword.text;

    if (email.isNotEmpty && email.contains('@')) {
      if (password.isNotEmpty && password.length > 6) {
        final userCredentials = LoginEntity(
          email: email,
          password: password,
          name: '',
        );
        if (userCredentials == null) {
          // TODO: SHOW ERROR
          return const Text('Usuario null');
        }
        Modular.to.navigate('/home/');
      } else {
        print('Senha inválida');
      }
    } else {
      print('Email inválido');
    }
  }

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
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                  top: size.width * 0.07,
                  bottom: size.width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWdiget(
                      controller: controllerEmail,
                      hintText: 'Email',
                      icon: Icon(
                        (Icons.email_outlined),
                        size: size.height * 0.024,
                      ),
                      isObscure: false,
                      keyboardType: TextInputType.emailAddress,
                      labelText: '',
                    ),
                    sizedBox,
                    TextFieldWdiget(
                      controller: controllerPassword,
                      hintText: 'Password',
                      isObscure: isObscure,
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
                        _validarCampos;
                      },
                      // () => Modular.to.navigate('/home/'),
                      width: size.width * 0.20,
                      height: size.height * 0.03,
                      // TODO: ARRUMAR BOTAO
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
