import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserCredential> loginWithEmailAndPassword({
    /// TODO: TROCAR O USER CREDENTIAL
    required String email,
    required String password,
  });
}
