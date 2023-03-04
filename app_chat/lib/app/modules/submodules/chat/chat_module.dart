import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_message_usecase_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_stream_messages_usecase_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/external/datasources/chat_datasource_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/repositories/chat_repository_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/controllers/chat_controller.dart';
import 'package:app_chat/app/modules/submodules/chat/presenter/pages/chat_page.dart';
import '../../../core/domain/usecases/remote_load_logged_user_data_usecase_impl.dart';

class ChatModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ChatDatasourceImpl(service: i())),
        Bind.factory((i) => ChatRepositoryImpl(i())),
        Bind.factory((i) => RemoteSaveChatStatusUseCaseImpl(i())),
        Bind.factory((i) => RemoteStreamMessagesUseCaseImpl(i())),
        Bind.factory((i) => RemoteSaveMessageUseCaseImpl(chatRepository: i())),
        Bind.singleton((i) => ChatController(
            remoteLoadLoggedUserData:
                Modular.get<RemoteLoadLoggedUserDataUseCaseImpl>(),
            remoteSaveChatStatus:
                Modular.get<RemoteSaveChatStatusUseCaseImpl>(),
            remoteStreamMessages:
                Modular.get<RemoteStreamMessagesUseCaseImpl>(),
            remoteSaveMessage: Modular.get<RemoteSaveMessageUseCaseImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ChatPage(
            recipientUser: args.data['usuarioDestinatario'],
            loggedUser: args.data['usuarioRemetente'],
          ),
        ),
      ];
}
