class ChatEntity {
  String senderId;
  String recipientId;
  String lastMessage;
  String recipientName;
  String recipientEmail;
  String imageUrlRecipient;

  ChatEntity({
    required this.senderId,
    required this.recipientId,
    required this.lastMessage,
    required this.recipientName,
    required this.recipientEmail,
    required this.imageUrlRecipient,
  });
}
