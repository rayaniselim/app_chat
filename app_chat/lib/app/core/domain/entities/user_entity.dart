class UserEntity {
  final String idUser;
  final String name;
  final String email;
  final String? image;

  const UserEntity({
    required this.idUser,
    this.image,
    required this.name,
    required this.email,
  });
}
