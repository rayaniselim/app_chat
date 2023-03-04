import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../modules/submodules/login/domain/exceptions/auth_exceptions.dart';
import '../../../modules/submodules/login/infra/services/auth_service.dart';
import '../../infra/datasources/user_datasource.dart';

class UserDataSourceImpl implements UserDataSource {
  final AuthService authService;
  final FirebaseFirestore firestore;

  UserDataSourceImpl({
    required this.authService,
    required this.firestore,
  });

  @override
  Future<Map<String, dynamic>> remoteFetchLoggedUserData() async {
    try {
      User? loggedUserData = authService.currentUser;
      if (loggedUserData == null) {
        throw NotAuthenticatedAuthException(stackTrace: StackTrace.current);
      }
      final document =
          await firestore.collection('usuarios').doc(loggedUserData.uid).get();
      return UserMapper().fromFirestoreDocument(document);
    } on MapperException catch (_) {
      rethrow;
    } on NotAuthenticatedAuthException catch (_) {
      rethrow;
    }
  }
}
