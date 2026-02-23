import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/data/repositories/auth_repository.dart';
import 'package:runna/presentation/state/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _storage = const FlutterSecureStorage();
  
  @override
  AuthState build() {
    // Inicializamos verificando autenticación
    Future.microtask(() => checkAuth());
    return const AuthState.initial();
  }

  Future<void> checkAuth() async {
    state = const AuthState.loading();

    final token = await _storage.read(key: "jwt_token");
    
    token == null 
      ? state = const AuthState.unauthenticated()
      : state = AuthState.authenticated(token: token);
  }

  Future<void> login(String username, String password) async {
    state = const AuthState.loading();

    try{
      
      final repo = ref.read(authRepositoryProvider);

      final token = await repo.login(username, password);

      state = AuthState.authenticated(token: token);

    }catch(e){
      state = const AuthState.unauthenticated();

      rethrow;
    }
  }

  void singUp() {
    state = const AuthState.loading();

    Future.delayed(const Duration(seconds: 2), () {
      state = const AuthState.unauthenticated();
    });
  }

  void logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AuthState.unauthenticated();
  }
}
