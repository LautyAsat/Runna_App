// excepciones.dart

abstract class AuthException implements Exception {}

class ValidationException extends AuthException {
  final Map<String, String> errors;

  ValidationException(this.errors);

  @override
  String toString() => 'ValidationException: $errors';
}

class GlobalAuthException extends AuthException {
  final String messageKey;

  GlobalAuthException(this.messageKey);

  @override
  String toString() => 'GlobalAuthException: $messageKey';
}