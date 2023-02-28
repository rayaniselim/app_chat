import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> loginWithEmailAndPassword(String email, String password);
}
