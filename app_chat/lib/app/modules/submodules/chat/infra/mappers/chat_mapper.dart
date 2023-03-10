import 'package:app_chat/app/modules/submodules/chat/domain/entities/chat_entity.dart';

class ChatMapper {
  String idRemetente;
  String idDestinatario;
  String ultimaMensagem;
  String nomeDestinatario;
  String emailDestinatario;
  String urlImagemDestinatario;

  ChatMapper({
    required this.idRemetente,
    required this.idDestinatario,
    required this.ultimaMensagem,
    required this.nomeDestinatario,
    required this.emailDestinatario,
    required this.urlImagemDestinatario,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'idRemetente': idRemetente,
      'idDestinatario': idDestinatario,
      'ultimaMensagem': ultimaMensagem,
      'nomeDestinatario': nomeDestinatario,
      'emailDestinatario': emailDestinatario,
      'urlImagemDestinatario': urlImagemDestinatario,
    };

    return map;
  }

  ChatEntity toEntity() {
    return ChatEntity(
      senderId: idRemetente,
      recipientId: idDestinatario,
      lastMessage: ultimaMensagem,
      recipientName: nomeDestinatario,
      recipientEmail: emailDestinatario,
      imageUrlRecipient: urlImagemDestinatario,
    );
  }

  factory ChatMapper.fromEntity(ChatEntity entity) {
    return ChatMapper(
      idRemetente: entity.senderId,
      idDestinatario: entity.recipientId,
      ultimaMensagem: entity.lastMessage,
      nomeDestinatario: entity.recipientName,
      emailDestinatario: entity.recipientEmail,
      urlImagemDestinatario: entity.imageUrlRecipient,
    );
  }
}
