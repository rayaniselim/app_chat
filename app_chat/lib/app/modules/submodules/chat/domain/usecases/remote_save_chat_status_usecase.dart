import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/helpers/end_connection_status_type.dart';

abstract class RemoteSaveChatStatusUseCase {
  Future<EndConnectionStatusType> call(ChatEntity chat);
}
