//Caso de uso: login remoto(nuvem, firebase..) com e-mail e senha

import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../entities/login_entity.dart';

abstract class RemoteLoginWithEmailAndPasswordUseCase {
  Future<Either<AppException, LoginEntity>> call(String email, String password);
}
