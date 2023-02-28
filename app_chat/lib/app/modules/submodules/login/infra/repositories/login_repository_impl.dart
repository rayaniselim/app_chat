import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({
    required this.loginDataSource,
  });

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return loginDataSource.loginWithEmailAndPassword(
        email: email, password: password);
  }
}
