import 'dart:async';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/helpers/end_connection_status_type.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_message_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../core/domain/entities/user_entity.dart';
import '../../../../../core/domain/usecases/remote_load_logged_user_data_usecase.dart';

class ChatController {
  final RemoteLoadLoggedUserDataUseCase remoteLoadLoggedUserData;
  final RemoteSaveChatStatusUseCase remoteSaveChatStatus;
  final RemoteStreamMessagesUseCase remoteStreamMessages;
  final RemoteSaveMessageUseCase remoteSaveMessage;

  ChatController({
    required this.remoteLoadLoggedUserData,
    required this.remoteSaveChatStatus,
    required this.remoteStreamMessages,
    required this.remoteSaveMessage,
  });

  late UserEntity recipientUser;
  late UserEntity loggedUser;

  TextEditingController controllerMensagem = TextEditingController();
  ScrollController scrollController = ScrollController();

  StreamController streamController =
      StreamController<List<ChatMessageEntity>>.broadcast();
  late StreamSubscription streamMensagens;

  void dispose() {
    scrollController.dispose();
    streamMensagens.cancel();
  }

  void adicionarListenerMensagens() {
    final result = remoteStreamMessages.call(
      idLoggedUser: loggedUser.userId,
      idRecipientUser: recipientUser.userId,
    );

    result.fold(
      (left) => null,
      // TODO: MELHORAR O TRATAMENTO DE ERRO E MOSTRAR O ERRO,
      (right) => streamMensagens = right.listen(
        (value) => streamController.add(value),
      ),
    );
  }

  void atualizarListenerMensagens() {
    UserEntity? recipientUser = Modular.get<ChatController>().recipientUser;

    recipientUser = recipientUser;
    adicionarListenerMensagens();
  }

  Future<void> _saveChatStatus(ChatEntity chat) async {
    final status = await remoteSaveChatStatus.call(chat);
    if (status == EndConnectionStatusType.failed) {
      // TODO: show some error
    }
    return;
  }

  Future<void> _saveMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageEntity message,
  }) async {
    // chamar caso de uso
    final status = await remoteSaveMessage.call(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );
    if (status == EndConnectionStatusType.failed) {
      // TODO: show some error
      return;
    }
    controllerMensagem.clear();
  }

  Future<void> enviarMensagem() async {
    String textMessage = controllerMensagem.text;
    if (textMessage.isNotEmpty) {
      String idLoggedUser = loggedUser.userId;
      ChatMessageEntity message = ChatMessageEntity(
        userId: idLoggedUser,
        text: textMessage,
        date: Timestamp.now().toString(),
      );

      //Salvar mensagem para remetente
      String idRecipientUser = recipientUser.userId;
      await _saveMessage(
        idLoggedUser: idLoggedUser,
        idRecipient: idRecipientUser,
        message: message,
      );
      ChatEntity conversaRementente = ChatEntity(
        recipientEmail: recipientUser.email,
        recipientId: idRecipientUser,
        senderId: idLoggedUser,
        recipientName: recipientUser.name,
        lastMessage: message.text,
        imageUrlRecipient: recipientUser.imageUrl,
      );
      await _saveChatStatus(conversaRementente);

      //Salvar mensagem para destinatário
      await _saveMessage(
        idLoggedUser: idRecipientUser,
        idRecipient: idLoggedUser,
        message: message,
      );
      ChatEntity conversationRecipient = ChatEntity(
        recipientEmail: loggedUser.email,
        recipientId: idLoggedUser,
        senderId: idRecipientUser,
        recipientName: loggedUser.name,
        lastMessage: message.text,
        imageUrlRecipient: loggedUser.imageUrl,
      );
      await _saveChatStatus(conversationRecipient);
    }
  }
}
