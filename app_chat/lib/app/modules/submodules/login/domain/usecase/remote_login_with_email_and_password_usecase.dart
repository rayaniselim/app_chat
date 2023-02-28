//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha

import '../../../../../core/domain/entities/user_entity.dart';

abstract class RemoteLoginWithEmailAndPasswordUseCase {
  Future<UserEntity> call(String email, String password);
}
