import 'package:dartz/dartz.dart';
import '../../../../../core/exceptions/app_exceptions.dart';
import '../entities/chat_entity.dart';

abstract class RemoteStreamMessagesUseCase {
  // Stream<QuerySnapshot<Map<String, dynamic>>>?
  Future<Either<AppException, ChatEntity>> call(
      {required String idLoggedUser, required String idRecipientUser});
}
