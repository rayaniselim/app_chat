class ChatEntity {
  final String idSender;
  final String idRecipient;
  final String lastMessage;
  final String nameRecipient;
  final String emailRecipient;
  final String imageRecipient;

  ChatEntity({
    required this.idSender,
    required this.idRecipient,
    required this.lastMessage,
    required this.nameRecipient,
    required this.emailRecipient,
    required this.imageRecipient,
  });
}
