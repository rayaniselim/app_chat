import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/helpers/end_connection_status_type.dart';

abstract class RemoteSaveMessageUseCase {
  Future<EndConnectionStatusType> call({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageEntity message,
  });
}
