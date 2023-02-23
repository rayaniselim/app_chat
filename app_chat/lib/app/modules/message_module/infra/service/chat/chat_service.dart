import 'package:app_chat/app/modules/domain/entities/user_model.dart';
import 'package:app_chat/app/modules/message_module/domain/entities/message_model.dart';

import 'chat_service_mock.dart';

abstract class ChatService {
  Stream<List<MessageModel>> messagesStream();
  // stream -> faz receber o  valor(mensagem) de forma automatica
  Future<MessageModel> save(String texto, UserModel user);

  factory ChatService() {
    return ChatServiceMock();
  }
}
