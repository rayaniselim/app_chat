import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../core/infra/mappers/user_mapper.dart';
import '../../domain/exceptions/auth_exceptions.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _datasource;

  LoginRepositoryImpl(
    this._datasource,
  );

  @override
  Future<Either<AppException, LoginEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final map = await _datasource.loginWithEmailandPassword(
        email,
        password,
      );
      final user = UserMapper.fromEntity(map);
      return Right(user);
    } on NotAuthenticatedAuthException catch (e, stack) {
      return Left(
        AuthException(
          message: 'Não autenticado',
          stackTrace: stack,
        ),
      );
    } on MapperException catch (e, stack) {
      return Left(MapperException(message: e.toString(), stackTrace: stack));
    }
  }
}
