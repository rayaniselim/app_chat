import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/usecases/remote_save_chat_status_usecase_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements ChatRepository {}

void main() {
  late ChatRepository repository;
  late RemoteSaveChatStatusUseCaseImpl usecase;
  final userChat = ChatEntity(
    imageUrlRecipient: '',
    lastMessage: '',
    recipientEmail: '',
    recipientId: '',
    recipientName: '',
    senderId: '',
  );

  final chatMapper = ChatMapper(
    emailDestinatario: 'rayani@user.com',
    idDestinatario: '',
    idRemetente: '',
    nomeDestinatario: '',
    ultimaMensagem: '',
    urlImagemDestinatario: '',
  );
  setUp(() {
    repository = RepositoryMock();
    usecase = RemoteSaveChatStatusUseCaseImpl(repository);
  });

  // test(
  //   'Deve retornar ..... ',
  //   () async {
  //     // Arrange
  //     when(() => repository.remotePutChatStatus(chatMapper)).thenAnswer(
  //       (_) async => userChat,
  //     );

  //     // Act
  //     final userResponse = await usecase(userChat);

  //     // Assert
  //     expect(userResponse, null);
  //   },
  // );
  // test('remote save chat status usecase impl ...', () async {
  //   // TODO: Implement test
  // });
}
