import '../entities/user_entity.dart';

abstract class RemoteLoadLoggedUserDataUseCase {
  UserEntity? call();
}
