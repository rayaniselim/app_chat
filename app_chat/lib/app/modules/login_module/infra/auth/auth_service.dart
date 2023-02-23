import 'package:app_chat/core/domain/entities/user_entity.dart';

import 'auth_service_mock.dart';

abstract class AuthService {
  UserEntity? get currentUser;

  Stream<UserEntity?> get userChanges;

  Future<void> signup(
    String name,
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
