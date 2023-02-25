import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/modules/messages/domain/entities/message_entity.dart';

import 'chat_service_mock.dart';

abstract class ChatService {
  Stream<List<MessageEntity>> messagesStream();
  // stream -> faz receber o  valor(mensagem) de forma automatica
  Future<MessageEntity> save(String texto, UserEntity user);

  factory ChatService() {
    return ChatServiceMock();
  }
}
