import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/presenter/stores/theme_store.dart';
import 'presenter/page/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ThemeStore()),
        // Bind.singleton((i) => null)
        // firebase
        // theme singleton
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/loginPage',
            child: ((_, __) =>
                LoginPage(themeStore: Modular.get<ThemeStore>()))),
      ];
}
