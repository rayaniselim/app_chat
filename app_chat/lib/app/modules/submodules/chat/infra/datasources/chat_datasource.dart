import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';

abstract class ChatDatasource {
  Future<void> remoteSetChatStatus(ChatMapper chat);

  Future<void> addMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
