import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

abstract class RemoteStreamMessagesUseCase {
  Either<AppException, Stream<List<ChatMessageEntity>>> call(
      {required String idLoggedUser, required String idRecipientUser});
}
