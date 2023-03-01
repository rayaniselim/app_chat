import '../../domain/entities/chat_entity.dart';

class ChatModel {
  final String idSender;
  final String idRecipient;
  final String lastMessage;
  final String nameRecipient;
  final String emailRecipient;
  final String imageRecipient;

  ChatModel({
    required this.idSender,
    required this.idRecipient,
    required this.lastMessage,
    required this.nameRecipient,
    required this.emailRecipient,
    required this.imageRecipient,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idSender": idSender,
      "idRecipient": idRecipient,
      "lastMessage": lastMessage,
      "nameRecipient": nameRecipient,
      "emailRecipient": emailRecipient,
      "imageRecipient": imageRecipient,
    };

    return map;
  }

  ChatEntity toEntity() {
    return ChatEntity(
      idSender: idSender,
      idRecipient: idRecipient,
      lastMessage: lastMessage,
      nameRecipient: nameRecipient,
      emailRecipient: emailRecipient,
      imageRecipient: imageRecipient,
    );
  }

  factory ChatModel.fromEntity(ChatEntity entity) {
    return ChatModel(
      idSender: entity.idSender,
      idRecipient: entity.idRecipient,
      lastMessage: entity.lastMessage,
      nameRecipient: entity.nameRecipient,
      emailRecipient: entity.emailRecipient,
      imageRecipient: entity.imageRecipient,
    );
  }
}
