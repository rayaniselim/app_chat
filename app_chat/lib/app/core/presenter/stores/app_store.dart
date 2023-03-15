import 'package:app_chat/app/core/presenter/stores/app_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AppStore extends NotifierStore<Exception, AppState> {
  // final  useCase;

  AppStore(
    super.initialState,
  );

  Future<void> get(String email, String password) async {
    // setLoading(true);

    // final result = await useCase.call(email, password);
    // result.fold((l) => print(l.message), ((r) => update()));

    /// executar o use case,
    /// either -> pegar com resut.fold
    /// se der riight da update
    /// se nao, mostra na tela um erro Exception,

    // await Future.delayed(const Duration(seconds: 1));

    /// o valor do update
    // update(LoadingState(
    //   state: '',

    //   /// pegar o email e senha do store
    // ));

    // setError(AuthException(
    //   message: 'Erro ao entrar',
    //   stackTrace: StackTrace.current,
    // ));

    // setLoading(false);
  }
}
