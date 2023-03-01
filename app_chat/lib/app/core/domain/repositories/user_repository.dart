import '../entities/user_entity.dart';

abstract class UserRepository {
  UserEntity? remoteGetLoggedUserData();
}
