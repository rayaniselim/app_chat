import '../repositories/login_repository.dart';

abstract class LoginWithEmail {}

class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImpl(
    this.repository,
  );
}


//// TODO: criar classe de failure/ erro




