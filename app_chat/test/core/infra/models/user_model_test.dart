import 'package:app_chat/core/domain/entities/user_entity.dart';
import 'package:app_chat/core/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toMap() deve retornar um Map<String, dynamic> Válido', () {
    final entity = UserModel(
      name: 'rayani',
      email: 'rayani@user.com',
      idUser: '1',
      image: '',
    );

    final json = entity.toMap();

    expect(json['image'], isEmpty);
    expect(json['name'], entity.name);
    expect(json['email'], entity.email);
    expect(json['idUser'], entity.idUser);
  });

  test('fromEntity() deve retornar um UserModel Válido', () {
    final entity = UserModel.fromEntity(const UserEntity(
      name: 'rayani',
      email: 'rayani@user.com',
      idUser: '1',
      image: '',
    ));
    expect(entity, isA<UserModel>());
    expect(entity.image, isEmpty);
    expect(entity.idUser, contains('1'));
  });
  test('toEntity() deve retornar um UserEntity Válido', () {
    const entity = UserEntity(
      name: 'rayani',
      email: 'rayani@user.com',
      idUser: '1',
      image: '',
    );
    expect(entity, isA<UserEntity>());
  });
}
