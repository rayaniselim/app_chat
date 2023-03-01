import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';

abstract class UserDataSource {
  /// busca remota de dados do usuário registrado
  UserMapper? remoteFetchLoggedUserData();
}
