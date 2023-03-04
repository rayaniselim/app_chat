import 'dart:async';

import '../mappers/chat_mapper.dart';
import '../models/chat_message_model.dart';

abstract class FirestoreService {
  Future<void> remotePutChatStatus(ChatMapper chat);
  Future<void> addMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  Stream<Map<String, dynamic>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
