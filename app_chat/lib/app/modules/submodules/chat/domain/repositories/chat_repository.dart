import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';

abstract class ChatRepository {
  Future<void> remotePutChatStatus(ChatMapper chat);

  Future<void> putMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> remoteStreamMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
