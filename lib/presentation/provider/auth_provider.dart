import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/presentation/state/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Inicializamos verificando autenticación
    Future.microtask(() => checkAuth());
    return const AuthState.initial();
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
