import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDatasource;

  const UserRepositoryImpl(this.userDatasource);

// Obter dados do usuário logado
  @override
  Future<UserEntity> remoteGetLoggedUserData() async {
    try {
      final map = await userDatasource.remoteFetchLoggedUserData();
      final entity = UserMapper.userFromMap(map);
      return entity;
    } on MapperException catch (_) {
      rethrow;
    }
  }
}
