import 'dart:async';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_message_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

class RemoteSaveMessageUseCaseImpl implements RemoteSaveMessageUseCase {
  final ChatRepository chatRepository;

  RemoteSaveMessageUseCaseImpl({required this.chatRepository});

  @override
  Future<Either<AppException, Unit>> call({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageEntity message,
  }) async {
    try {
      await chatRepository.putMessage(
        idLoggedUser: idLoggedUser,
        idRecipient: idRecipient,
        message: ChatMessageModel.fromEntity(message),
      );
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
