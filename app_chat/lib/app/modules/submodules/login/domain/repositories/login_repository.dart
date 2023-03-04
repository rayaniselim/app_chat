import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/app_exceptions.dart';

abstract class LoginRepository {
  Future<Either<AppException, LoginEntity>> loginWithEmailAndPassword(
      String email, String password);
}
