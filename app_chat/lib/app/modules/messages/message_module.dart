import 'package:app_chat/app/modules/messages/presenter/page/chat_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class MessageModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/chat/',
        child: ((context, args) => ChatPage(userEntity: args.data))),
  ];
}
