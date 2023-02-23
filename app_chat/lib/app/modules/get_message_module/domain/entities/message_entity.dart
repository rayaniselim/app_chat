class MessageEntity {
  final String id;
  final String message;
  final DateTime date;

  final String userId;
  final String userName;

  MessageEntity({
    required this.id,
    required this.message,
    required this.date,
    required this.userId,
    required this.userName,
  });
}
