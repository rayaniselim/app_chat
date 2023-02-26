import '../../domain/entities/chat_message_entity.dart';

/// Mensagens q aparecem dentro do chat na page home
class ChatMessageModel {
  String idUser;
  String text;
  String date;

  ChatMessageModel({
    required this.idUser,
    required this.text,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUser": idUser,
      "text": text,
      "date": date,
    };

    return map;
  }

  ChatMessageEntity toEntity() {
    return ChatMessageEntity(
      date: date,
      idUser: idUser,
      text: text,
    );
  }

  factory ChatMessageModel.fromEntity(ChatMessageEntity entity) {
    return ChatMessageModel(
      date: entity.date,
      idUser: entity.idUser,
      text: entity.text,
    );
  }
}
