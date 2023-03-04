import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/external/datasources/chat_datasource_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasourceImpl chatDatasource;

  const ChatRepositoryImpl(this.chatDatasource);

  @override
  Future<void> remotePutChatStatus(ChatMapper chat) async {
    await chatDatasource.remoteSetChatStatus(chat);
    return;
  }

  @override
  Future<void> putMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  }) async {
    return await chatDatasource.addMessage(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );
  }

  @override
  Either<AppException, Stream<List<ChatMessageEntity>>> remoteStreamMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    final streamMap = chatDatasource.remoteSnapshotMessages(
      idLoggedUser: idLoggedUser,
      idRecipientUser: idRecipientUser,
    );

    final streamEntity = streamMap.map((event) =>
        event.map((value) => ChatMessageMapper().fromMap(value)).toList());

    return Right(streamEntity);
  }
}

class ChatMessageMapper {
  ChatMessageEntity fromMap(Map<String, dynamic> map) {
    return ChatMessageEntity(
      date: map['data'],
      text: map['texto'],
      userId: map['idUsuario'],
    );
  }
}
