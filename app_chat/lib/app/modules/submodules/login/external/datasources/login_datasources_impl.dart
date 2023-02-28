import 'package:firebase_auth/firebase_auth.dart';

import '../../infra/datasources/login_datasource.dart';

class LoginDatasourceImpl implements LoginDataSource {
  final FirebaseAuth auth;

  LoginDatasourceImpl({required this.auth});

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
