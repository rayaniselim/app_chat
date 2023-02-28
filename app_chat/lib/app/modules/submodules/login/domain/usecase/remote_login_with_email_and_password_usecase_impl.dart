import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../repositories/login_repository.dart';

//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha
class RemoteLoginWithEmailAndPasswordUseCaseImpl {
  final LoginRepository _loginRepository; //propriedade

  RemoteLoginWithEmailAndPasswordUseCaseImpl(this._loginRepository);

  Future<LoginEntity> call(
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
