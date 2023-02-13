class UserModel {
  final String name;
  final String email;
  final String idUser;

  const UserModel({
    required this.name,
    required this.email,
    required this.idUser,
  });
}


// o model  é a entidade
// precisa ser o mais puro possivel
// nao colocar os tojson e fromjson


