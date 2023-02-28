import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/exceptions/auth_exceptions.dart';
import '../auth_service.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth;

  const FirebaseAuthService(this._auth);

  @override
  Future<Map<String, dynamic>> loginWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw InvalidUserAuthException(stackTrace: StackTrace.current);
      }
      return _credentialToMap(credential.user!);
    } on FirebaseAuthException catch (e, s) {
      throw _handleFirebaseException(e, s);
    }
  }

  AuthException _handleFirebaseException(
      FirebaseAuthException err, StackTrace stack) {
    switch (err.code) {
      case 'invalid-email':
        throw InvalidEmailAuthException(stackTrace: err.stackTrace ?? stack);
      case 'user-disabled':
        throw DisabledUserAuthException(stackTrace: err.stackTrace ?? stack);
      case 'user-not-found':
        throw UserNotFoundAuthException(stackTrace: err.stackTrace ?? stack);
      case 'wrong-password':
        throw WrongPasswordAuthException(stackTrace: err.stackTrace ?? stack);
      default:
        throw AuthException(
          message: 'Generic exception ${err.code}',
          stackTrace: err.stackTrace ?? stack,
        );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e, s) {
      _handleFirebaseException(e, s);
    }
  }

  @override
  Future<Map<String, dynamic>> getUser() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw NotAuthenticatedAuthException(stackTrace: StackTrace.current);
    }

    return _credentialToMap(user);
  }

  Map<String, dynamic> _credentialToMap(User credential) {
    return {
      'email': credential.email,
      'id': credential.uid,
    };
  }
}
