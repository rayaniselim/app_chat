import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteSaveChatStatusUseCase {
  Future<Either<AppException, Unit>> call(ChatEntity chat);
}
