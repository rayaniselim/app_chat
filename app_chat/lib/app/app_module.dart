import 'package:app_chat/app/modules/submodules/chat/chat_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/domain/usecases/remote_load_logged_user_data_usecase_impl.dart';
import 'core/external/datasources/user_datasource_impl.dart';
import 'core/infra/repositories/user_repository_impl.dart';
import 'core/presenter/stores/theme_store.dart';
import 'modules/submodules/home/home_page.dart';
import 'modules/submodules/login/infra/services/auth/firebase_auth_service.dart';
import 'modules/submodules/login/login_module.dart';

/* ESTE MODULO É GLOBAL(é a RAIZ) para todo o app
essa classe  existe APENAS para instanciar injecao de dependencia,
que é um padrao q obriga vc a desacoplar as coisas, 
(trabalhar de forma desacoplada) e fazer inversao de controle,
*/
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ThemeStore()),
    Bind.factory((i) => FirebaseAuth.instance),
    Bind.factory((i) => FirebaseFirestore.instance),
    Bind.factory((i) => UserRepositoryImpl(i())),
    Bind.factory((i) => RemoteLoadLoggedUserDataUseCaseImpl(i())),
    Bind.factory((i) => FirebaseAuthService(i())),
    Bind.factory((i) => UserDataSourceImpl(
          authService: i(),
          firestore: i(),
        )),
  ];

  @override
  List<Module> get imports => [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ChildRoute('/home',
        child: ((_, __) => HomePage(themeStore: Modular.get<ThemeStore>()))),
    ModuleRoute('/chat', module: ChatModule()),
  ];
}

/// TODO: CHAMAR A ROTA NO MODULAR
// () => Modular.to.navigate('/login/');
// () => Modular.to.pushNamed('/login/');
// ao inves de usar assim
// Modular.to.navigate('/product/list/');
/// subistitua por ./list/
