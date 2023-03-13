import 'package:app_chat/app/core/domain/entities/user_entity.dart';
import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/login/domain/entities/login_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toMap() deve retornar um Map Válido', () {
    const user = UserEntity(
      name: 'rayani',
      email: 'rayani@user.com',
      userId: '1',
      imageUrl: '',
    );

    final map = UserMapper().toMap(user);

    expect(map, isA<Map>());
  });

/*TODO:: 
Instance of 'MapperException'
package:app_chat/app/core/infra/mappers/user_mapper.dart 32:7  UserMapper.fromUser
test/app/core/infra/mappers/user_mapper_test.dart
*/
  test(
    'o fromUser() do tipo LoginEntity deve retornar um UserMapper Válido',
    () {
      User? user;
      final exception = MapperException(
        message: '',
        stackTrace: StackTrace.current,
      );

      final entity = UserMapper.fromUser(user);
      final entityNull = UserMapper.fromUser(null);

      expect(entity, isA<LoginEntity>());
      expect(entityNull, throwsA(MapperException));
    },
  );

  test('toEntity() deve retornar um UserEntity Válido', () {
    const user = UserEntity(
      name: 'rayani',
      email: 'rayani@user.com',
      userId: '1',
      imageUrl: '',
    );
    final json = UserMapper().toEntity(user);

    expect(json, isA<UserEntity>());
    expect(user.name, json.name);
  });

  test(
    'o loginFromMap() do tipo LoginEntity deve retornar um UserMapper Válido',
    () {
      final entity = UserMapper.loginFromMap({
        'email': 'rayani@user.com',
        'id': '1',
      });
      expect(entity, isA<LoginEntity>());
      expect(entity.email, isNotEmpty);
      expect(entity.id, contains('1'));
    },
  );

  test(
    'o chatFromMap() do tipo ChatMessageModel deve retornar um UserMapper e MapperException Válido',
    () {
      final entity = ChatMessageModel(
        texto: 'texto',
        idUsuario: 'idUsuario',
        data: 'data',
      );

      final chat = UserMapper.chatFromMap(entity.toMap());

      final map = MapperException(
        message: 'chatFromMap - Erro na conversão',
        stackTrace: StackTrace.current,
      );

      expect(chat, isA<ChatMessageModel>());
      expect(map, isA<MapperException>());
    },
  );

  test(
    'o userFromMap() do tipo UserEntity deve retornar um UserMapper Válido',
    () {
      final entity = UserMapper.userFromMap({
        'email': 'rayani@user.com',
        'userId': 'userId',
        'name': 'rayani',
        'imageUrl': 'imageUrl',
      });
      expect(entity, isA<UserEntity>());
      expect(entity.name, contains('r'));
    },
  );

  /// TODO: TESTAR COM DOCUMENT FIREBASE??
  // test(
  //   'o fromFirestoreDocument() do tipo UserEntity deve retornar um UserMapper Válido',
  //   () {
  //     final map = {
  //       'email': 'rayani@user.com',
  //       'userId': 'userId',
  //       'name': 'rayani',
  //       'imageUrl': 'imageUrl',
  //     };
  //     final DocumentSnapshot doc;
  //     final entity = UserMapper.fromFirestoreDocument(doc);
  //     //   'email': 'rayani@user.com',
  //     //   'userId': 'userId',
  //     //   'name': 'rayani',
  //     //   'imageUrl': 'imageUrl',
  //     // });
  //     expect(entity, isA<UserEntity>());
  //     expect(entity.email, isA<Map>());
  //     expect(entity.name, contains('r'));
  //   },
  // );
}
