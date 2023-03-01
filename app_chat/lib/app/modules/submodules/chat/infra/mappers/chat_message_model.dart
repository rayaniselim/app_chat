import '../../domain/entities/chat_message_entity.dart';

/// Mensagens q aparecem dentro do chat na page home
class ChatMessageMapper {
  String idUser;
  String text;
  String date;

  ChatMessageMapper({
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

  factory ChatMessageMapper.fromEntity(ChatMessageEntity entity) {
    return ChatMessageMapper(
      date: entity.date,
      idUser: entity.idUser,
      text: entity.text,
    );
  }
}
