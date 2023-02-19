class UserModel {
  final String name;
  final String email;

  final String image;

  // this.imageUser,
  const UserModel({
    required this.image,
    required this.name,
    required this.email,
  });
}

// o model  é a entidade
// precisa ser o mais puro possivel
// nao colocar os tojson e fromjson
