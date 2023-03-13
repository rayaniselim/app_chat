import 'package:app_chat/app/modules/submodules/chat/external/datasources/chat_datasource_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/services/firestore_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirestoreServiceMock extends Mock implements FirestoreService {}

void main() {
  final firestoreServiceMock = FirestoreServiceMock();
  final dataSource = ChatDatasourceImpl(service: firestoreServiceMock);
  test('Deve retornar um Map<String, dynamic>', () async {
    const idLoggedUser = '1';
    const idRecipient = '2';
    final message = ChatMessageModel(
      data: '12/02',
      idUsuario: '1',
      texto: 'Olá',
    );

    when(() => firestoreServiceMock.addMessage(
          idLoggedUser: idLoggedUser,
          idRecipient: idRecipient,
          message: message,
        )).thenAnswer((_) => dataSource.addMessage(
          /// TODO: verificar se funciona, loading demorado
          idLoggedUser: idLoggedUser,
          idRecipient: idRecipient,
          message: message,
        ));

    final resultService = dataSource.addMessage(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );

    expect(resultService, isNotEmpty);
  });
}
