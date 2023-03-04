abstract class LoginDataSource {
  Future<Map<String, dynamic>> loginWithEmailandPassword(
      String email, String password);
}
