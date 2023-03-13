import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import 'package:app_chat/app/modules/submodules/login/domain/repositories/login_repository.dart';
import 'package:app_chat/app/modules/submodules/login/domain/usecase/remote_login_with_email_and_password_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements LoginRepository {}

void main() {
  late LoginRepository repository;
  late RemoteLoginWithEmailAndPasswordUseCaseImpl usecase;
  const userLogin = LoginEntity(
    id: '',
    email: '',
  );
  setUp(() {
    repository = RepositoryMock();
    usecase = RemoteLoginWithEmailAndPasswordUseCaseImpl(repository);
  });

  test(
    'Deve retornar um usuário quando o email tiver um "@" e a senha for maior '
    'ou igual a 6 dígitos',
    () async {
      // Arrange
      const email = 'rayani@user.com';
      const password = '123456';
      when(() => repository.loginWithEmailAndPassword(email, password))
          .thenAnswer(
        (_) async => const Right(userLogin),
      );

      // Act
      final userResponse = await usecase(email, password);

      // Assert
      expect(userResponse, const Right<AppException, LoginEntity>(userLogin));
    },
  );

  test(
    'Deve lançar uma ValidationException dizendo que o email é inválido quando '
    'o email não conter "@"',
    () {
      // Arrange
      const email = 'rayaniuser.com';
      const password = '123456';

      // Act
      final response = usecase(email, password);

      // Assert
      expect(() async => await response, throwsA(isA<ValidationException>()));
    },
  );

  test(
    'Deve lançar uma ValidationException dizendo que a senha é inválido quando '
    'a senha tiver menos que 6 caracteres',
    () {
      // Arrange
      const email = 'rayani@user.com';
      const password = '12345';

      // Act
      final response = usecase(email, password);

      // Assert
      expect(() async => await response, throwsA(isA<ValidationException>()));
    },
  );
}
