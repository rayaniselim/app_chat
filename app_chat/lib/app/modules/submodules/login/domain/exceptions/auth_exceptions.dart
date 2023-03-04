import '../../../../../core/exceptions/app_exceptions.dart';

class AuthException extends AppException {
  const AuthException({
    required super.message,
    required super.stackTrace,
  });
}

class NotAuthenticatedAuthException extends AuthException {
  const NotAuthenticatedAuthException({
    required super.stackTrace,
  }) : super(message: 'Não autenticado');
}

class InvalidUserAuthException extends AuthException {
  const InvalidUserAuthException({
    required super.stackTrace,
  }) : super(message: 'Usuário vazio ao realizar o login');
}

class InvalidEmailAuthException extends AuthException {
  const InvalidEmailAuthException({
    required super.stackTrace,
  }) : super(message: 'Endereço de email inválido');
}

class DisabledUserAuthException extends AuthException {
  const DisabledUserAuthException({
    required super.stackTrace,
  }) : super(message: 'Usuário desabilitado');
}

class UserNotFoundAuthException extends AuthException {
  const UserNotFoundAuthException({
    required super.stackTrace,
  }) : super(message: 'Usuário não encontrado');
}

class WrongPasswordAuthException extends AuthException {
  const WrongPasswordAuthException({
    required super.stackTrace,
  }) : super(message: 'Senha incorreta');
}
