import 'package:app_chat/app/page_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/presenter/stores/theme_store.dart';

import 'modules/login_module/login_module.dart';

/* ESTE MODULO É GLOBAL(é a RAIZ) para todo o app
essa classe  existe APENAS para instanciar injecao de dependencia,
que é um padrao q obriga vc a desacoplar as coisas, 
(trabalhar de forma desacoplada) e fazer inversao de controle,
*/
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ThemeStore()) //, export: true),
  ];
  // @override
  // List<Module> get imports => [
  //       ThemeStore(),
  //     ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login/', module: LoginModule()),
    ChildRoute('/test/', child: ((_, __) => const PageTest())),

    // ModuleRoute('home', module: HomePage()),
    // ModuleRoute('chat', module: ChatPage()),
  ];
}


/// TODO: CHAMAR A ROTA NO MODULAR 
// Modular.to.navigate('/login/');
// ao inves de usar assim
// Modular.to.navigate('/product/list/');
/// subistitua por ./list/
