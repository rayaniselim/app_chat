import 'package:app_chat/app/core/infra/mappers/user_mapper.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';
import 'package:app_chat/app/modules/submodules/chat/domain/repositories/chat_repository.dart';
import 'package:app_chat/app/modules/submodules/chat/external/datasources/chat_datasource_impl.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/mappers/chat_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasourceImpl chatDatasource;

  const ChatRepositoryImpl(this.chatDatasource);

  @override
  Future<void> remotePutChatStatus(ChatMapper chat) async {
    await chatDatasource.remoteSetChatStatus(chat);
    return;
  }

  @override
  Future<void> putMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  }) async {
    return await chatDatasource.addMessage(
      idLoggedUser: idLoggedUser,
      idRecipient: idRecipient,
      message: message,
    );
  }

  @override
  // Stream<QuerySnapshot<Map<String, dynamic>>>
  Future<Either<AppException, ChatEntity>> remoteStreamMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) async {
    try {
      final data = chatDatasource.remoteSnapshotMessages(
      idLoggedUser: idLoggedUser,
      idRecipientUser: idRecipientUser,
    );
    final user = UserMapper.
    } catch (e) 
    
    {
      
    }
    // return await chatDatasource.remoteSnapshotMessages(
    //   idLoggedUser: idLoggedUser,
    //   idRecipientUser: idRecipientUser,
    // );
  }
}


//  @override
//   Future<Either<AppException, LoginEntity>> loginWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       final map = await _datasource.loginWithEmailandPassword(
//         email,
//         password,
//       );
//       final user = UserMapper.loginFromMap(map);
//       return Right(user);

      
//     } on NotAuthenticatedAuthException catch (e, stack) {
//       return Left(
//         AuthException(
//           message: 'Não autenticado',
//           stackTrace: stack,
//         ),
//       );
//     } on MapperException catch (e, stack) {
//       return Left(
//         MapperException(
//           message: e.toString(),
//           stackTrace: stack,
//         ),
//       );
//     }
//   }
