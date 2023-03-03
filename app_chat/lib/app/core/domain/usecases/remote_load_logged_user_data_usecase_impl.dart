import 'package:app_chat/app/core/domain/usecases/remote_load_logged_user_data_usecase.dart';

import '../../infra/repositories/user_repository_impl.dart';
import '../entities/user_entity.dart';

class RemoteLoadLoggedUserDataUseCaseImpl
    implements RemoteLoadLoggedUserDataUseCase {
  final UserRepositoryImpl chatRepository;

  const RemoteLoadLoggedUserDataUseCaseImpl(this.chatRepository);

  @override
  Future<UserEntity> call() async {
    try {
      UserEntity user = await chatRepository.remoteGetLoggedUserData();
      return user;
    } catch (error) {
      rethrow;
    }
  }
}
