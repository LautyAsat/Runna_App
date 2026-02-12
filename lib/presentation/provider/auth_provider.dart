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

  Future<bool> login(String username, String password) async {
    state = const AuthState.loading();

    // Simulamos delay de red
    await Future.delayed(const Duration(milliseconds: 500));

    // Por ahora solo aceptamos "test"/"123456"
    if (username == "test" && password == "123456") {
      state = AuthState.authenticated(user: username);
      return true;
    }

    // Si falla, volvemos a unauthenticated (sin error, eso lo maneja el form)
    state = const AuthState.unauthenticated();
    return false;
  }

  void singUp() {
    // Aquí iría la lógica de registro, por ahora solo simulamos un proceso
    state = const AuthState.loading();

    Future.delayed(const Duration(seconds: 2), () {
      state = const AuthState.unauthenticated();
    });
  }

  void logout() {
    state = const AuthState.unauthenticated();
  }
}
