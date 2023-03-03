import 'dart:developer';

import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/helpers/end_connection_status_type.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/repositories/chat_repository_impl.dart';

class RemoteSaveChatStatusUseCaseImpl implements RemoteSaveChatStatusUseCase {
  final ChatRepositoryImpl chatRepository;

  const RemoteSaveChatStatusUseCaseImpl(this.chatRepository);

  @override
  Future<EndConnectionStatusType> call(ChatEntity chat) async {
    try {
      await chatRepository.remotePutChatStatus(ChatMapper.fromEntity(chat));

      return EndConnectionStatusType.successed;
    } catch (error) {
      log('[ERROR ON: RemoteSaveChatStatusUseCaseImpl]$error');
    }
    return EndConnectionStatusType.failed;
  }
}
