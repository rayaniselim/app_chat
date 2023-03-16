class ChatState {
  final String message;
  const ChatState({
    required this.message,
  });

  ChatState copyWith({
    String? message,
  }) {
    return ChatState(
      message: message ?? this.message,
    );
  }
}
