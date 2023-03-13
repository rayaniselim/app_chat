import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<Map<String, dynamic>> loginWithEmailandPassword(
      String email, String password);
  User? get currentUser;
}
