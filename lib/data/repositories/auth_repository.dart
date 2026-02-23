import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/core/exceptions/auth_exceptions.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository (Ref ref) => AuthRepository();

class AuthRepository {

  final _storage = const FlutterSecureStorage();

  Future<String> login (String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if(username != "test"){
      throw ValidationException({"user": "error_user_not_exists"});
    }

    if (username != "test" && password != "123456") {
      throw GlobalAuthException("error_invalid_credentials");
    }

    const token = "3213213rdsfdstgre";

    await _storage.write(key: "jwt_token", value: token);

    return token;
  }

  Future<void> logout() async{
    await _storage.delete(key: "jwt_token");
  }

}