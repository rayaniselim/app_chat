import 'dart:async';

import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../mappers/messages_mapper.dart';
import '../firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firestore;

  const FirebaseFirestoreServiceImpl(this.firestore);

  @override
  Future<void> remotePutChatStatus(chat) async {
    final chatMap = chat.toMap();
    await firestore
        .collection('conversas')
        .doc(chat.idRemetente)
        .collection('ultimas_mensagens')
        .doc(chat.idDestinatario)
        .set(chatMap);
  }

  @override
  Future<void> addMessage(
      {required String idLoggedUser,
      required String idRecipient,
      required ChatMessageModel message}) async {
    final chatMessageMap = message.toMap();
    await firestore
        .collection('mensagens')
        .doc(idLoggedUser)
        .collection(idRecipient)
        .add(chatMessageMap);
  }

  @override
  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    try {
      final result = firestore
          .collection('mensagens')
          .doc(idLoggedUser)
          .collection(idRecipientUser)
          .orderBy('data', descending: true)
          .snapshots()
          .map(
            (subscription) => subscription.docs
                .map(
                  (doc) => MessagesMapper().fromQuerySnapshot(doc),
                )
                .toList(),
          );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
