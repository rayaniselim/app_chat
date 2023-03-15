class ChatState {
  final String email;
  final String password;

  const ChatState({
    required this.email,
    required this.password,
  });

  ChatState copyWith({
    String? email,
    String? password,
  }) {
    return ChatState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
