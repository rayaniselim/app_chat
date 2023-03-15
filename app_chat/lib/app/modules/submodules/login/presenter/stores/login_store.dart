import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../domain/usecase/remote_login_with_email_and_password_usecase.dart';
import 'login_state.dart';

class LoginStore extends NotifierStore<Exception, LoginState> {
  final RemoteLoginWithEmailAndPasswordUseCase useCase;
  final FirebaseAuth auth;

  LoginStore(super.initialState, this.useCase, this.auth);

  Future<void> get({required String email, required String password}) async {
    setLoading(true);

    final result = await useCase.call(email, password);
    result.fold(
      (l) => setError(l),
      ((r) {
        update(state);
        Modular.to.navigate('/home');
      }),
    );

    setLoading(false);
  }
}

    /// executar o use case,
    /// either -> pegar com resut.fold
    /// se der riight da update
    /// se nao, mostra na tela um erro Exception,
