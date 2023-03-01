import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../../external/datasources/user_datasource_impl.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSourceImpl userDatasource;

  const UserRepositoryImpl(this.userDatasource);

// Obter dados do usuário logado
  @override
  UserEntity? remoteGetLoggedUserData() {
    return userDatasource.remoteFetchLoggedUserData()?.toEntity();
  }
}
