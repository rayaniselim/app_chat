import 'package:app_chat/app/modules/message_module/presenter/page/chat_page.dart';
import 'package:app_chat/app/modules/presenter/pages/home_page/presenter/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_module/presenter/page/login_page.dart';

/* ESTE MODULO É GLOBAL(é a RAIZ) para todo o app
essa classe  existe APENAS para instanciar injecao de dependencia,
que é um padrao q obriga vc a desacoplar as coisas, 
(trabalhar de forma desacoplada) e fazer inversao de controle,
*/
class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute('/', module: LoginPage()),
    // ModuleRoute('home', module: HomePage()),
    // ModuleRoute('chat', module: ChatPage()),
  ];
}
