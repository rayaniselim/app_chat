import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toMap() deve retornar um Map Válido', () {
    final userMapper = ChatMapper(
      idRemetente: '',
      idDestinatario: '',
      ultimaMensagem: '',
      nomeDestinatario: '',
      emailDestinatario: '',
      urlImagemDestinatario: '',
    );

    final map = userMapper.toMap();

    expect(map, isA<Map>());
  });

  test('toEntity() deve retornar um ChatEntity Válido', () {
    final userMapper = ChatMapper(
      idRemetente: '',
      idDestinatario: '',
      ultimaMensagem: '',
      nomeDestinatario: '',
      emailDestinatario: '',
      urlImagemDestinatario: '',
    );
    final json = userMapper.toEntity();

    expect(json, isA<ChatEntity>());
  });

  test(
    'o fromEntity() do tipo ChatEntity deve retornar um ChatMapper',
    () {
      final entity = ChatEntity(
        senderId: '',
        recipientId: '',
        lastMessage: '',
        recipientName: '',
        recipientEmail: '',
        imageUrlRecipient: '',
      );

      final chat = ChatMapper.fromEntity(entity);

      expect(chat, isA<ChatMapper>());
    },
  );
}
