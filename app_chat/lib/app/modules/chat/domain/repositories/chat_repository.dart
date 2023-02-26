import '../../../../../core/domain/entities/user_entity.dart';

abstract class ChatRepository {
  UserEntity? get userRecipient;

  set userRecipient(UserEntity? usuario);
}
