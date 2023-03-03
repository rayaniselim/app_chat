abstract class UserDataSource {
  /// busca remota de dados do usuário registrado
  Future<Map<String, dynamic>> remoteFetchLoggedUserData();
}
