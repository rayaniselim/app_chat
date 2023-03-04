import '../entities/user_entity.dart';

abstract class RemoteLoadLoggedUserDataUseCase {
  Future<UserEntity> call();
}
