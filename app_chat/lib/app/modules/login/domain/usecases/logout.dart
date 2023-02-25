import '../repositories/login_repository.dart';

abstract class Logout {}

class LogoutImpl implements Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);
}
