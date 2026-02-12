import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/screens/home_screen.dart';
import 'package:runna/presentation/screens/login_screen.dart';
import 'package:runna/presentation/screens/sing_up_screen.dart';

part "app_router.g.dart";

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: "/login",
    redirect: (context, state) {
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isLoggingIn = state.uri.path == '/login' || state.uri.path == '/register' || state.uri.path == '/';

      print("pase por aca");

      if (!isAuthenticated && !isLoggingIn) {

        print("$isLoggingIn - $isAuthenticated ||| ${state.uri.path}");

        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {

        print("te vas pal home");


        return '/home';
      }


      print("retornare null");
      return null;
    },
    routes: [
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
      GoRoute(path: "/register", builder: (context, state) => const SingUpScreen()),
    ],
  );
}
