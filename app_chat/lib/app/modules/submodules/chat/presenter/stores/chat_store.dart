import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/entities/chat_message_entity.dart';

import '../../domain/usecases/remote_save_chat_status_usecase.dart';
import '../../domain/usecases/remote_save_message_usecase.dart';
import '../../domain/usecases/remote_stream_messages_usecase.dart';
import 'chat_state.dart';

class ChatStore extends NotifierStore<Exception, ChatState> {
  final RemoteSaveChatStatusUseCase remoteSaveChatStatusUseCase;
  final RemoteSaveMessageUseCase remoteSaveMessageUseCase;
  final RemoteStreamMessagesUseCase remoteStreamMessagesUseCase;

  ChatStore(
    super.initialState,
    this.remoteSaveChatStatusUseCase,
    this.remoteSaveMessageUseCase,
    this.remoteStreamMessagesUseCase,
  );

  Future<void> getRemoteStreamMessagesUseCase(
      {required String idLoggedUser, required String idRecipientUser}) async {
    setLoading(true);

    final result = remoteStreamMessagesUseCase.call(
      idLoggedUser: idLoggedUser,
      idRecipientUser: idRecipientUser,
    );
    result.fold(
      (l) => setError(l),
      ((r) {
        update(state);
      }),
    );
    setLoading(false);
  }

  Future<void> getRemoteSaveMessageUseCase({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageEntity message,
  }) async {
    setLoading(true);

    final result = await remoteSaveMessageUseCase.call(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );

    result.fold(
      (l) => setError(l),
      ((r) {
        update(state);
      }),
    );

    setLoading(false);
  }

  Future<void> getRemoteSaveChatStatusUseCase(
      {required ChatEntity chat}) async {
    setLoading(true);

    final result = await remoteSaveChatStatusUseCase.call(chat);
    return result.fold(
      (l) => setError(l),
      ((r) {
        update(state);
      }),
    );
  }
}

/// executar o use case,
/// either -> pegar com resut.fold
/// se der riight da update
/// se nao, mostra na tela um erro Exception,
