import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/screens/home_screen.dart';
import 'package:runna/presentation/screens/login_screen.dart';
import 'package:runna/presentation/screens/sing_up_screen.dart';

part "app_router.g.dart";

/// Notifier que escucha cambios de autenticación y notifica al router
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // Escuchamos cambios en el auth notifier
    _ref.listen(authNotifierProvider, (_, __) {
      notifyListeners();
    });
  }
}

@riverpod
GoRouter appRouter(Ref ref) {
  // Creamos el notifier que avisará al router cuando hay cambios
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: "/login",
    refreshListenable: notifier, // Notifica cambios sin recrear el router
    redirect: (context, state) {
      // Leemos el estado actual dentro del redirect
      final authState = ref.read(authNotifierProvider);

      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isLoggingIn =
          state.uri.path == '/login' ||
          state.uri.path == '/register' ||
          state.uri.path == '/';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: "/register",
        builder: (context, state) => const SingUpScreen(),
      ),
    ],
  );
}
