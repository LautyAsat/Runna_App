// excepciones.dart

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class UserNotFoundException extends AuthException {
  UserNotFoundException() : super("User not found");
}

class WrongPasswordException extends AuthException {
  WrongPasswordException() : super("Wrong password");
}