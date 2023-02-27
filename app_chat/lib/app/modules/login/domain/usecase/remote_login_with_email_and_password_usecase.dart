//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteLoginWithEmailAndPasswordUseCase {
  Future<UserCredential>? call({
    required String email,
    required String password,
  });
}
