import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../infra/datasources/user_datasource.dart';

class UserDataSourceImpl implements UserDataSource {
  // TODO: FIREBASE TIRAR DEPOIS E PASSAR PRO SERVICE
  final FirebaseAuth auth;
  final UserEntity user;

  UserDataSourceImpl({
    required this.user,
    required this.auth,
  });

  @override
  UserMapper? remoteFetchLoggedUserData() {
    User? loggedUserData = auth.currentUser;

    if (loggedUserData == null) return null;

    return UserMapper(
      idUser: loggedUserData.uid,
      name: loggedUserData.displayName ?? '',
      email: loggedUserData.email ?? '',
      image: loggedUserData.photoURL ?? '',
    );
  }
}
