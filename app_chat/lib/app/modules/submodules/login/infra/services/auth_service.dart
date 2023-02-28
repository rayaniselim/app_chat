abstract class AuthService {
  Future<Map<String, dynamic>> loginWithEmailandPassword(
      String email, String password);
  Future<void> logout();
  Future<Map<String, dynamic>> getUser();
}
