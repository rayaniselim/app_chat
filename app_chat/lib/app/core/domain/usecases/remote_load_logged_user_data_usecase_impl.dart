import 'package:app_chat/app/core/domain/usecases/remote_load_logged_user_data_usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class RemoteLoadLoggedUserDataUseCaseImpl
    implements RemoteLoadLoggedUserDataUseCase {
  final UserRepository userRepository;

  const RemoteLoadLoggedUserDataUseCaseImpl(this.userRepository);

  @override
  Future<UserEntity> call() async {
    try {
      UserEntity user = await userRepository.remoteGetLoggedUserData();
      return user;
    } catch (error) {
      rethrow;
    }
  }
}
