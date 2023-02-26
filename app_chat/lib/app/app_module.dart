import 'package:app_chat/app/modules/chat/chat_module.dart';
import 'package:app_chat/core/presenter/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/presenter/stores/theme_store.dart';
import 'modules/login/login_module.dart';

/* ESTE MODULO É GLOBAL(é a RAIZ) para todo o app
essa classe  existe APENAS para instanciar injecao de dependencia,
que é um padrao q obriga vc a desacoplar as coisas, 
(trabalhar de forma desacoplada) e fazer inversao de controle,
*/
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ThemeStore()),
  ];

  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ChildRoute(
      '/home/',
      child: ((_, __) => HomePage(themeStore: Modular.get<ThemeStore>())),
    ),
    ModuleRoute('/chat/', module: ChatModule()),
  ];
}

/// TODO: CHAMAR A ROTA NO MODULAR
// () => Modular.to.navigate('/login/');
// () => Modular.to.pushNamed('/login/');
// ao inves de usar assim
// Modular.to.navigate('/product/list/');
/// subistitua por ./list/
