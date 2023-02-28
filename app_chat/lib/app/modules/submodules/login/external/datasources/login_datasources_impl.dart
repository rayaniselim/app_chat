import '../../infra/datasources/login_datasource.dart';
import '../../infra/services/auth_service.dart';

class LoginDatasourceImpl implements LoginDataSource {
  final AuthService _authService;

  const LoginDatasourceImpl(this._authService);
  @override
  Future<Map<String, dynamic>> loginWithEmailandPassword(
    String email,
    String password,
  ) {
    return _authService.loginWithEmailandPassword(email, password);
  }
}
