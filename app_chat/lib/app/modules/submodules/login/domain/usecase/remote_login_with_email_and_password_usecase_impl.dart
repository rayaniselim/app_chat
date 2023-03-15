import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import 'package:app_chat/app/modules/submodules/login/domain/usecase/remote_login_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../repositories/login_repository.dart';

//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha
class RemoteLoginWithEmailAndPasswordUseCaseImpl
    implements RemoteLoginWithEmailAndPasswordUseCase {
  final LoginRepository _loginRepository; //propriedade

  RemoteLoginWithEmailAndPasswordUseCaseImpl(this._loginRepository);

  @override
  Future<Either<AppException, LoginEntity>> call(
    String email,
    String password,
  ) async {
    final emailRegex = RegExp(r'^.+@.+$');
    if (!emailRegex.hasMatch(email)) {
      throw ValidationException(
        message: 'Email inválido',
        stackTrace: StackTrace.current,
      );
    }

    if (password.length < 6) {
      throw ValidationException(
        message: 'Senha não pode ter menos que 6 caracteres',
        stackTrace: StackTrace.current,
      );
    }

    final user =
        await _loginRepository.loginWithEmailAndPassword(email, password);
    return user;
  }
}
