import 'package:app_chat/app/modules/submodules/login/presenter/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../core/presenter/stores/theme_store.dart';
import '../stores/login_state.dart';

class LoginPage extends StatefulWidget {
  final ThemeStore themeStore;
  final LoginStore store;

  const LoginPage({
    Key? key,
    required this.themeStore,
    required this.store,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sizedBox = const SizedBox(height: 20);
  bool isObscure = true;

  TextEditingController controllerEmail =
      TextEditingController(text: 'rayani@user.com');
  TextEditingController controllerPassword =
      TextEditingController(text: '123456');

  @override
  void initState() {
    super.initState();
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
                height: size.height * 0.39,
                padding: EdgeInsets.only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                  top: size.width * 0.07,
                  bottom: size.width * 0.05,
                ),
                child: ScopedBuilder<LoginStore, Exception, LoginState>(
                  store: widget.store,
                  onState: (context, state) {
                    return Column(
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
                          labelText: 'Email',
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
                          onPressed: () async {
                            await widget.store.get(
                              email: controllerEmail.text,
                              password: controllerPassword.text,
                            );
                          },
                          width: size.width * 0.20,
                          height: size.height * 0.03,
                        ),
                      ],
                    );
                  },
                  onError: (context, error) =>
                      Center(child: Text(error.toString())),
                  // TODO: MELHORAR O TRATAMENTO DE ERRO
                  onLoading: (context) => const CircularProgressIndicator(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
