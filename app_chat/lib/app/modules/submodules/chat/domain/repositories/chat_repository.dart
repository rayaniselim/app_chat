import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

abstract class ChatRepository {
  Future<Either<AppException, Unit>> remotePutChatStatus(ChatMapper chat);

  Future<Either<AppException, Unit>> putMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  Either<AppException, Stream<List<ChatMessageEntity>>> remoteStreamMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
