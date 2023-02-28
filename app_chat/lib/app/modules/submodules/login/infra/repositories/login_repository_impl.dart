import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import '../../../../../core/infra/mappers/user_mapper.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _datasource;

  LoginRepositoryImpl(
    this._datasource,
  );

  @override
  Future<LoginEntity> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final map = await _datasource.loginWithEmailandPassword(
      email,
      password,
    );

    final user = UserMapper.fromEntity(map);

    return user;
  }
}
//   Future<UserEntity> loginWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) {
//     return loginDataSource.loginWithEmailAndPassword(
//         email: email, password: password);
//   }
// }
