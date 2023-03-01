import 'dart:developer';

import 'package:app_chat/app/core/domain/usecases/remote_load_logged_user_data_usecase.dart';

import '../../infra/repositories/user_repository_impl.dart';
import '../entities/user_entity.dart';

class RemoteLoadLoggedUserDataUseCaseImpl
    implements RemoteLoadLoggedUserDataUseCase {
  final UserRepositoryImpl chatRepository;

  const RemoteLoadLoggedUserDataUseCaseImpl(this.chatRepository);

  @override
  UserEntity? call() {
    try {
      UserEntity? user = chatRepository.remoteGetLoggedUserData();

      return user;
    } catch (error) {
      log('[ERROR ON: RemoteLoadLoggedUserDataUseCaseImpl]$error');
    }
    return null;
  }
}
