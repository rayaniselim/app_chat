import '../../../modules/submodules/login/domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../exceptions/app_exceptions.dart';

class UserMapper {
  String idUser;
  String name;
  String email;
  String image;

  UserMapper({
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

  static LoginEntity fromEntity(Map<String, dynamic> map) {
    try {
      return LoginEntity(
        email: map['email'],
        id: map['id'],
      );
    } catch (e, s) {
      throw MapperException(
        message: 'UserMapper - Erro na conversão',
        stackTrace: s,
      );
    }
  }
}
