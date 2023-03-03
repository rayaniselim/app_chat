import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../modules/submodules/login/domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../exceptions/app_exceptions.dart';

class UserMapper {
  Map<String, dynamic> toMap(UserEntity entity) {
    Map<String, dynamic> map = {
      "userId": entity.userId,
      "name": entity.name,
      "email": entity.email,
      "imageUrl": entity.imageUrl,
    };

    return map;
  }

  Map<String, dynamic> fromUser(User? user) {
    try {
      Map<String, dynamic> map = {
        "userId": user!.uid,
        "name": user.displayName ?? '',
        "email": user.email,
        "imageUrl": user.photoURL ?? '',
      };

      return map;
    } catch (e, s) {
      throw MapperException(
        message: 'fromUser - Erro na conversão',
        stackTrace: s,
      );
    }
  }

  UserEntity toEntity(UserEntity entity) {
    return UserEntity(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      imageUrl: entity.imageUrl,
    );
  }

  static LoginEntity loginFromMap(Map<String, dynamic> map) {
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

  UserEntity userFromMap(Map<String, dynamic> map) {
    try {
      return UserEntity(
        email: map['email'],
        userId: map['userId'],
        name: map['name'],
        imageUrl: map['imageUrl'],
      );
    } catch (e, s) {
      throw MapperException(
        message: 'UserMapper - Erro na conversão',
        stackTrace: s,
      );
    }
  }

  Map<String, dynamic> fromFirestoreDocument(DocumentSnapshot doc) {
    try {
      final map = {
        'email': doc['email'],
        'userId': doc['userId'],
        'name': doc['name'],
        'imageUrl': doc['imageUrl'],
      };
      return map;
    } catch (e, s) {
      throw MapperException(
        message: 'UserMapper - Erro na conversão',
        stackTrace: s,
      );
    }
  }
}
