import 'package:app_chat/app/modules/submodules/chat/infra/datasources/chat_datasource.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/services/firestore_service.dart';

class ChatDatasourceImpl implements ChatDatasource {
  final FirestoreService service;

  ChatDatasourceImpl({
    required this.service,
  });

  @override
  Future<void> remoteSetChatStatus(ChatMapper chat) async {
    final chatMock = ChatMapper(
      emailDestinatario: chat.emailDestinatario,
      idDestinatario: chat.idDestinatario,
      idRemetente: chat.idRemetente,
      nomeDestinatario: chat.nomeDestinatario,
      ultimaMensagem: chat.ultimaMensagem,
      urlImagemDestinatario: chat.urlImagemDestinatario,
    );
    await service.remotePutChatStatus(chatMock);
  }

  @override
  Future<void> addMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  }) async {
    // final chatMessageMap = message.toMap();
    final result = await service.addMessage(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );
    // await firestore
    //     .collection('mensagens')
    //     .doc(idLoggedUser)
    //     .collection(idRecipient)
    //     .add(chatMessageMap);
    return result;
  }

  @override
  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    final result = service.remoteSnapshotMessages(
      idLoggedUser: idLoggedUser,
      idRecipientUser: idRecipientUser,
    );

    return result;
    // return firestore
    //     .collection('mensagens')
    //     .doc(idLoggedUser)
    //     .collection(idRecipientUser)
    //     .orderBy('data', descending: true)
    //     .snapshots();
  }
}
