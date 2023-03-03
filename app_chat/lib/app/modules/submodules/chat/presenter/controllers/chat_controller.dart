import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/helpers/end_connection_status_type.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_message_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase.dart';

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

  late UserEntity usuarioDestinatario;
  late UserEntity usuarioRemetente;

  TextEditingController controllerMensagem = TextEditingController();
  ScrollController scrollController = ScrollController();

  StreamController streamController =
      StreamController<QuerySnapshot>.broadcast();
  late StreamSubscription streamMensagens;

  void dispose() {
    scrollController.dispose();
    streamMensagens.cancel();
  }

  void adicionarListenerMensagens() {
    final stream = remoteStreamMessages.call(
      idLoggedUser: usuarioRemetente.userId,
      idRecipientUser: usuarioDestinatario.userId,
    );

    if (stream == null) {
      // TODO: show some error
      return;
    }
    streamMensagens = stream.listen((dados) {
      streamController.add(dados);
    });
  }

  void atualizarListenerMensagens() {
    UserEntity? usuarioDestinatario =
        Modular.get<ChatController>().usuarioDestinatario;

    usuarioDestinatario = usuarioDestinatario;
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
    String textoMensagem = controllerMensagem.text;
    if (textoMensagem.isNotEmpty) {
      String idUsuarioRemetente = usuarioRemetente.userId;
      ChatMessageEntity mensagem = ChatMessageEntity(
        idUsuario: idUsuarioRemetente,
        texto: textoMensagem,
        data: Timestamp.now().toString(),
      );

      //Salvar mensagem para remetente
      String idUsuarioDestinatario = usuarioDestinatario.userId;
      await _saveMessage(
        idLoggedUser: idUsuarioRemetente,
        idRecipient: idUsuarioDestinatario,
        message: mensagem,
      );
      ChatEntity conversaRementente = ChatEntity(
        emailDestinatario: usuarioDestinatario.email,
        idDestinatario: idUsuarioDestinatario,
        idRemetente: idUsuarioRemetente,
        nomeDestinatario: usuarioDestinatario.name,
        ultimaMensagem: mensagem.texto,
        urlImagemDestinatario: usuarioDestinatario.imageUrl,
      );
      await _saveChatStatus(conversaRementente);

      //Salvar mensagem para destinatário
      await _saveMessage(
        idLoggedUser: idUsuarioDestinatario,
        idRecipient: idUsuarioRemetente,
        message: mensagem,
      );
      ChatEntity conversaDestinatario = ChatEntity(
        emailDestinatario: usuarioRemetente.email,
        idDestinatario: idUsuarioRemetente,
        idRemetente: idUsuarioDestinatario,
        nomeDestinatario: usuarioRemetente.name,
        ultimaMensagem: mensagem.texto,
        urlImagemDestinatario: usuarioRemetente.imageUrl,
      );
      await _saveChatStatus(conversaDestinatario);
    }
  }
}
