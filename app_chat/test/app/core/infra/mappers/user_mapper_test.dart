// import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
// import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('toMap() deve retornar um Map<String, dynamic> Válido', () {
//     final entity = UserMapper(
//       name: 'rayani',
//       email: 'rayani@user.com',
//       userId: '1',
//       image: '',
//     );

//     final json = entity.toMap();

//     expect(json['image'], isEmpty);
//     expect(json['name'], entity.name);
//     expect(json['email'], entity.email);
//     expect(json['userId'], entity.userId);
//   });

//   test('o fromEntity() do tipo LoginEntity deve retornar um UserMapper Válido',
//       () {
//     final entity = UserMapper.fromEntity({
//       'email': 'rayani@user.com',
//       'id': '1',
//     });
//     expect(entity, isA<LoginEntity>());
//     expect(entity.email, isNotEmpty);
//     expect(entity.id, contains('1'));
//   });
// }
