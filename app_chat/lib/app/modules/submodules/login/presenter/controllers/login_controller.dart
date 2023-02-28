import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/usecase/remote_login_with_email_and_password_usecase_impl.dart';

class LoginController {
  final RemoteLoginWithEmailAndPasswordUseCaseImpl
      remoteLoginWithEmailAndPassword;

  LoginController(this.remoteLoginWithEmailAndPassword);

  TextEditingController controllerEmail =
      TextEditingController(text: 'rayani@user.com');
  TextEditingController controllerPassword =
      TextEditingController(text: '123456');
  FirebaseAuth auth = Modular.get<FirebaseAuth>();

  /// botao login
  validarCampos() async {
    String email = controllerEmail.text;
    String password = controllerPassword.text;

    if (email.isNotEmpty && email.contains('@')) {
      if (password.isNotEmpty && password.length < 6) {
        final userCredentials = await remoteLoginWithEmailAndPassword.call(
            email: email, password: password);

        if (userCredentials == null) {
          // TODO: ERROR
          return;
        }

        Modular.to.navigate('/home/');
      } else {
        const Text('Senha inválida');
      }
    } else {
      const Text('Email inválido');
    }
  }
}
