import 'package:app_chat/app/modules/login/domain/entities/login_entity.dart';

import '../../../login/domain/repositories/login_repository.dart';
import '../../../login/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<LoginEntity> loggedUser() async {
    // TODO: implement loginEmail
    throw UnimplementedError();

    // message: "Error when trying to retrieve current logged in user"
  }

  @override
  Future<LoginEntity> loginEmail(String email, String password) {
    // TODO: implement loginEmail
    throw UnimplementedError();
    // 'Error when logging in'
  }

  @override
  Future<LoginEntity> logout() {
    // TODO: implement logout
    throw UnimplementedError();
    // 'Error when trying to exit' -  erro ao tentar sair
  }
}
