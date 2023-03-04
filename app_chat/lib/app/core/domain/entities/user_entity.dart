class UserEntity {
  final String userId;
  final String name;
  final String email;
  final String imageUrl;

  const UserEntity({
    required this.userId,
    this.imageUrl = '',
    required this.name,
    required this.email,
  });
}
