import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../entities/chat_entity.dart';

abstract class ChatRepository {
  Future<void> remotePutChatStatus(ChatMapper chat);

  Future<void> putMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  // Stream<QuerySnapshot<Map<String, dynamic>>>
  Future<Either<AppException, ChatEntity>> remoteStreamMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
