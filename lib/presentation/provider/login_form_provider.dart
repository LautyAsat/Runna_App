import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/state/login_form_state.dart';

part 'login_form_provider.g.dart';

@riverpod
class LoginFormNotifier extends _$LoginFormNotifier {
  @override
  LoginFormState build() {
    return const LoginFormState();
  }

  void clearFieldErrors() {
    state = state.copyWith(
      usernameError: null,
      passwordError: null,
      generalError: null,
    );
  }

  Future<bool> submit(
    String username,
    String password, {
    required String emptyUsernameError,
    required String emptyPasswordError,
    required String invalidCredentialsError,
  }) async {
    // Validación local
    String? usernameError;
    String? passwordError;

    if (username.isEmpty) {
      usernameError = emptyUsernameError;
    }

    if (password.isEmpty) {
      passwordError = emptyPasswordError;
    }

    if (usernameError != null || passwordError != null) {
      state = state.copyWith(
        usernameError: usernameError,
        passwordError: passwordError,
      );
      return false;
    }

    // Intentamos login
    state = state.copyWith(isLoading: true, generalError: null);

    final authNotifier = ref.read(authNotifierProvider.notifier);
    final success = await authNotifier.login(username, password);

    state = state.copyWith(isLoading: false);

    if (!success) {
      state = state.copyWith(generalError: invalidCredentialsError);
      return false;
    }

    return true;
  }

  void clearErrors() {
    state = state.copyWith(
      usernameError: null,
      passwordError: null,
      generalError: null,
    );
  }
}
