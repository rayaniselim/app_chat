abstract class AppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppException({
    required this.message,
    required this.stackTrace,
  });
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    required super.stackTrace,
  });
}

class MapperException extends AppException {
  const MapperException({
    required super.message,
    required super.stackTrace,
  });
}

class RemoteStreamMessagesException extends AppException {
  const RemoteStreamMessagesException({
    required super.message,
    required super.stackTrace,
  });
}

class RemoteSaveMessageUseCaseException extends AppException {
  const RemoteSaveMessageUseCaseException({
    required super.message,
    required super.stackTrace,
  });
}
