import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/modules/submodules/login/domain/repositories/login_repository.dart';
import 'package:app_chat/app/modules/submodules/login/infra/datasources/login_datasource.dart';
import 'package:app_chat/app/modules/submodules/login/infra/repositories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements LoginDataSource {}

void main() {
  late LoginDataSource datasource;
  late LoginRepository repository;

  setUp(() {
    datasource = DatasourceMock();
    repository = LoginRepositoryImpl(datasource);
  });

  test(
    'Deve um usuário quando receber um map válido',
    () async {
      // Arrange
      const email = 'rayani@user.com';
      const password = '123456';
      const responseMock = {'id': '', 'name': '', 'email': ''};
      when(() => datasource.loginWithEmailandPassword(email, password))
          .thenAnswer((_) async => responseMock);

      // Act
      final userResponse =
          await repository.loginWithEmailAndPassword(email, password);

      // Assert
      expect(userResponse, isA<UserEntity>());
    },
  );

  test(
    'Deve lançar uma MapperException quando receber um map inválido',
    () async {
      // Arrange
      const email = 'rayani@user.com';
      const password = '123456';
      const responseMock = <String, dynamic>{};
      when(() => datasource.loginWithEmailandPassword(email, password))
          .thenAnswer((_) async => responseMock);

      // Act
      final response = repository.loginWithEmailAndPassword(email, password);

      // Assert
      expect(() async => await response, throwsA(isA<MapperException>()));
    },
  );
}
