import 'package:app_chat/app/modules/login/domain/entities/login_entity.dart';

import 'auth_service_mock.dart';

abstract class AuthService {
  LoginEntity? get currentUser;

  Stream<LoginEntity?> get userChanges;

  Future<void> signup(
    String email,
    String password,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
  }
}
