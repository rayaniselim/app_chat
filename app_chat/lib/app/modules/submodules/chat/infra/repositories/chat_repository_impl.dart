import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';

import '../../../../../core/domain/entities/user_entity.dart';

class ChatRepositoryImpl implements ChatRepository {
  UserEntity? _userRecipient;

  @override
  UserEntity? get userRecipient => _userRecipient;

  @override
  set userRecipient(UserEntity? user) {
    _userRecipient = user;
  }
}
