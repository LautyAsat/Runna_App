import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/presentation/state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  // Estado inicial
  AuthNotifier() : super(const AuthState.initial()) {
    checkAuth();
  }

  Future<void> checkAuth() async {
    state = const AuthState.loading();

    // Leemos secureStorage/sharedPreferences para ver si el usuario ya esta logueado
    await Future.delayed(const Duration(seconds: 2));

    state = const AuthState.unauthenticated();
  }

  void login(String username) {
    state = AuthState.authenticated(user: username);
  }

  void logout() {
    state = const AuthState.unauthenticated();
  }

}

// Este el provider (tipo context en react) para poder acceder desde cualquier widget
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});