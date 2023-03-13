import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/core/domain/repositories/user_repository.dart';
import 'package:app_chat/app/core/domain/usecases/remote_load_logged_user_data_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements UserRepository {}

void main() {
  late UserRepository repository;
  late RemoteLoadLoggedUserDataUseCaseImpl usecase;

  const user = UserEntity(
    email: '',
    name: '',
    userId: '',
    imageUrl: '',
  );
  setUp(() {
    repository = RepositoryMock();
    usecase = RemoteLoadLoggedUserDataUseCaseImpl(repository);
  });

  test(
    'Deve retornar o tipo UserEntity',
    () async {
      // Arrange
      when(() => repository.remoteGetLoggedUserData())
          .thenAnswer((_) async => user);

      // Act
      final userResponse = await usecase();

      // Assert
      expect(userResponse, isA<UserEntity>());
    },
  );
}
