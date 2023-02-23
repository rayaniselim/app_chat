class UserEntity {
  final String id;
  final String name;
  final String email;
  final String image;

  const UserEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
  });
}

// o model  é a entidade
// precisa ser o mais puro possivel
// nao colocar os tojson e fromjson
