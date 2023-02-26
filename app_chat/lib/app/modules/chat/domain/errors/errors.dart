abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
}

class ErrorSendingMessage extends Failure {
  // enviar
  @override
  final String message;
  ErrorSendingMessage({required this.message});
}

class ErrorReceivingMessage extends Failure {
  // ao receber
  @override
  final String message;
  ErrorReceivingMessage({required this.message});
}
