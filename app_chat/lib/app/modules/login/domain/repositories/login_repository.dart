import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> loginEmail(String email, String password);
  Future<LoginEntity> loggedUser();
  Future<LoginEntity> logout();
}
