import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

class RemoteStreamMessagesUseCaseImpl implements RemoteStreamMessagesUseCase {
  final ChatRepository chatRepository;

  RemoteStreamMessagesUseCaseImpl(this.chatRepository);

  @override
  Either<AppException, Stream<List<ChatMessageEntity>>> call({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    // try {
    final result = chatRepository.remoteStreamMessages(
      idLoggedUser: idLoggedUser,
      idRecipientUser: idRecipientUser,
    );

    return result;

    // } on RemoteStreamMessagesException catch (e, s) {
    //   throw RemoteStreamMessagesException(
    //     message: e.message,
    //     stackTrace: s,
    //   );
    // }
  }
}
