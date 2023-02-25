import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/login_entity.dart';
import '../../infra/datasources/login_datasource.dart';

class FirebaseLoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;

  FirebaseLoginDataSourceImpl(this.auth);

  @override
  Future<LoginEntity> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<LoginEntity> loginEmail(String email, String password) {
    // TODO: implement loginEmail
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
