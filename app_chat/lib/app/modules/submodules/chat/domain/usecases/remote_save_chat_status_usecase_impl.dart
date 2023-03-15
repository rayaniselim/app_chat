import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../repositories/chat_repository.dart';

class RemoteSaveChatStatusUseCaseImpl implements RemoteSaveChatStatusUseCase {
  final ChatRepository chatRepository;

  const RemoteSaveChatStatusUseCaseImpl(this.chatRepository);

  @override
  Future<Either<AppException, Unit>> call(ChatEntity chat) async {
    try {
      await chatRepository.remotePutChatStatus(ChatMapper.fromEntity(chat));

      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
