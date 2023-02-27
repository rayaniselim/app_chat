import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/login_repository.dart';

//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha
class RemoteLoginWithEmailAndPasswordUseCaseImpl {
  final LoginRepository loginRepository;

  RemoteLoginWithEmailAndPasswordUseCaseImpl({required this.loginRepository});

  Future<UserCredential?> call({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials = await loginRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials;
    } catch (error) {
      log('[ERROR ON: RemoteLoginWithEmailAndPasswordUseCaseImpl]$error');
    }
    return Future.value(null);
  }
}
