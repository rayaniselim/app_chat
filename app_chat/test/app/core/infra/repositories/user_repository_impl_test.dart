import 'package:app_chat/app/core/domain/repositories/user_repository.dart';
import 'package:app_chat/app/core/infra/datasources/user_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_chat/app/core/infra/repositories/user_repository_impl.dart';

class DatasourceMock extends Mock implements UserDataSource {}

void main() {
  late UserDataSource datasource;
  late UserRepository repository;

  setUp(() {
    datasource = DatasourceMock();
    repository = UserRepositoryImpl(datasource);
  });

/*
TODO:
Instance of 'MapperException'
package:app_chat/app/core/infra/mappers/user_mapper.dart 86:7                 UserMapper.userFromMap
package:app_chat/app/core/infra/repositories/user_repository_impl.dart 17:33  UserRepositoryImpl.remoteGetLoggedUserData
*/
  test(
    'Deve um usuário quando receber um map válido',
    () async {
      // Arrange

      const map = {
        'id': '1',
        'name': 'rayani',
        'email': 'rayani@user.com',
      };
      when(() => datasource.remoteFetchLoggedUserData())
          .thenAnswer((_) async => map);

      // Act
      final userResponse = await repository.remoteGetLoggedUserData();

      // Assert
      expect(userResponse, isA<Map>());
    },
  );
}
