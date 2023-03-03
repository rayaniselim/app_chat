import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/presenter/stores/theme_store.dart';
import 'domain/usecase/remote_login_with_email_and_password_usecase_impl.dart';
import 'external/datasources/login_datasources_impl.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'presenter/controllers/login_controller.dart';
import 'presenter/page/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ThemeStore()),
        Bind.factory((i) => FirebaseAuth.instance),
        Bind.factory((i) => FirebaseFirestore.instance),
        Bind.singleton((i) => LoginDatasourceImpl(i())),
        Bind.singleton((i) => LoginRepositoryImpl(i())),
        Bind.singleton((i) => RemoteLoginWithEmailAndPasswordUseCaseImpl(i())),
        Bind.singleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/loginPage',
            child: ((_, __) =>
                LoginPage(themeStore: Modular.get<ThemeStore>()))),
      ];
}
