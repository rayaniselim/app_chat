import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/modules/chat/domain/entities/chat_entity.dart';

import 'chat_service_mock.dart';

abstract class ChatService {
  Stream<List<ChatEntity>> messagesStream();
  // stream -> faz receber o  valor(mensagem) de forma automatica
  Future<ChatEntity> save(String texto, UserEntity user);

  factory ChatService() {
    return ChatServiceMock();
  }
}
