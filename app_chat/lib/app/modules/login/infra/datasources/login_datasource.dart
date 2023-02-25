import '../../domain/entities/login_entity.dart';

abstract class LoginDataSource {
  Future<LoginEntity> loginEmail(String email, String password);
  Future<LoginEntity> currentUser();
  Future<void> logout();
}
