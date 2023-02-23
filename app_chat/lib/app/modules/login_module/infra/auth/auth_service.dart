import 'package:app_chat/app/modules/domain/entities/user_model.dart';

import 'auth_service_mock.dart';

abstract class AuthService {
  UserModel? get currentUser;

  Stream<UserModel?> get userChanges;

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
