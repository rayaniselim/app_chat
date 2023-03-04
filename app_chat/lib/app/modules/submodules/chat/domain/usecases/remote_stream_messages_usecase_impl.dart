import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../entities/chat_entity.dart';

class RemoteStreamMessagesUseCaseImpl implements RemoteStreamMessagesUseCase {
  final ChatRepository chatRepository;

  RemoteStreamMessagesUseCaseImpl(this.chatRepository);

  @override
  // Stream<QuerySnapshot<Map<String, dynamic>>>?
  Future<Either<AppException, ChatEntity>> call({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    try {
      final stream = chatRepository.remoteStreamMessages(
        idLoggedUser: idLoggedUser,
        idRecipientUser: idRecipientUser,
      );

      return stream;
    } on RemoteStreamMessagesException catch (e, s) {
      // log('[ERROR ON: RemoteStreamMessagesUseCaseImpl]$error');
      throw RemoteStreamMessagesException(
        message: e.message,
        stackTrace: s,
      );
    }
  }
}
