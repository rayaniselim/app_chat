import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../mappers/chat_mapper.dart';
import '../models/chat_message_model.dart';

abstract class FirestoreService {
  Future<Either<AppException, Unit>> remotePutChatStatus(ChatMapper chat);
  Future<Either<AppException, Unit>> addMessage({
    required String idLoggedUser,
    required String idRecipient,
    required ChatMessageModel message,
  });

  Stream<List<Map<String, dynamic>>> remoteSnapshotMessages({
    required String idLoggedUser,
    required String idRecipientUser,
  });
}
