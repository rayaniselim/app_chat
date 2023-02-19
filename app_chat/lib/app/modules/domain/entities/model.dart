class UserModel {
  final String name;
  final String email;

  final String image;
  final String? message;

  // this.imageUser,
  const UserModel({
    required this.image,
    this.message,
    required this.name,
    required this.email,
  });
}

// o model  é a entidade
// precisa ser o mais puro possivel
// nao colocar os tojson e fromjson
