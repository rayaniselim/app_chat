import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_message_entity.dart';

/// Mensagens q aparecem dentro do chat
class ChatMessageModel {
  String idUsuario;
  String texto;
  String data;

  ChatMessageModel({
    required this.idUsuario,
    required this.texto,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'idUsuario': idUsuario,
      'texto': texto,
      'data': data,
    };
    return map;
  }

  ChatMessageEntity toEntity() {
    return ChatMessageEntity(
      date: data,
      userId: idUsuario,
      text: texto,
    );
  }

  factory ChatMessageModel.fromEntity(ChatMessageEntity entity) {
    return ChatMessageModel(
      data: entity.date,
      idUsuario: entity.userId,
      texto: entity.text,
    );
  }
}
