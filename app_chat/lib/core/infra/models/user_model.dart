import '../../domain/entities/user_entity.dart';

class UserModel {
  String idUser;
  String name;
  String email;
  String image;

  UserModel({
    required this.idUser,
    required this.name,
    required this.email,
    this.image = "",
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUser": idUser,
      "name": name,
      "email": email,
      "image": image,
    };

    return map;
  }

  UserEntity toEntity() {
    return UserEntity(
      idUser: idUser,
      name: name,
      email: email,
      image: image,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      idUser: entity.idUser,
      name: entity.name,
      email: entity.email,
      image: entity.image!,
    );
  }
}
