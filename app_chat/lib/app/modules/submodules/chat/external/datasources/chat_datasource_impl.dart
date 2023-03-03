import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/datasources/chat_datasource.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';

class ChatDatasourceImpl implements ChatDatasource {
  final FirebaseFirestore firestore;

  ChatDatasourceImpl({
    required this.firestore,
  });

  @override
  Future<void> remoteSetChatStatus(ChatMapper chat) async {
    final chatMap = chat.toMap();
    await firestore
        .collection('conversas')
        .doc(chat.idRemetente)
        .collection('ultimas_mensagens')
        .doc(chat.idDestinatario)
        .set(chatMap);
  }

  @override
  Future<void> addMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  }) async {
    final chatMessageMap = message.toMap();
    await firestore
        .collection('mensagens')
        .doc(idLoggedUser)
        .collection(idRecipient)
        .add(chatMessageMap);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    return firestore
        .collection('mensagens')
        .doc(idLoggedUser)
        .collection(idRecipientUser)
        .orderBy('data', descending: true)
        .snapshots();
  }
}
