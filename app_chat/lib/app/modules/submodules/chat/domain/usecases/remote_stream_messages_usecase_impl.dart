import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase.dart';

class RemoteStreamMessagesUseCaseImpl implements RemoteStreamMessagesUseCase {
  final ChatRepository chatRepository;

  RemoteStreamMessagesUseCaseImpl(this.chatRepository);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>>? call({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    try {
      final stream = chatRepository.remoteStreamMessages(
        idLoggedUser: idLoggedUser,
        idRecipientUser: idRecipientUser,
      );

      return stream;
    } catch (error) {
      log('[ERROR ON: RemoteStreamMessagesUseCaseImpl]$error');
    }
    return null;
  }
}
