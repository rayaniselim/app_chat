import 'dart:async';
import 'package:app_chat/app/core/exceptions/app_exceptions.dart';
import 'package:app_chat/app/modules/submodules/chat/infra/models/chat_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../mappers/messages_mapper.dart';
import '../firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firestore;

  const FirebaseFirestoreServiceImpl(this.firestore);

  @override
  Future<Either<AppException, Unit>> remotePutChatStatus(chat) async {
    final chatMap = chat.toMap();

    try {
      await firestore
          .collection('conversas')
          .doc(chat.idRemetente)
          .collection('ultimas_mensagens')
          .doc(chat.idDestinatario)
          .set(chatMap);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppException, Unit>> addMessage(
      {required String idLoggedUser,
      required String idRecipient,
      required ChatMessageModel message}) async {
    final chatMessageMap = message.toMap();

    try {
      await firestore
          .collection('mensagens')
          .doc(idLoggedUser)
          .collection(idRecipient)
          .add(chatMessageMap);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(e);
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  }) {
    try {
      final result = firestore
          .collection('mensagens')
          .doc(idLoggedUser)
          .collection(idRecipientUser)
          .orderBy('data', descending: true)
          .snapshots()
          .map(
            (subscription) => subscription.docs
                .map(
                  (doc) => MessagesMapper().fromQuerySnapshot(doc),
                )
                .toList(),
          );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
