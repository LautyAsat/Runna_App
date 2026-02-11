import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/screens/home_screen.dart';
import 'package:runna/presentation/screens/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
      initial: () => const Scaffold(body: Center(child: Text('Checking auth...'))),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      authenticated: (user) => const HomeScreen(),
      unauthenticated: () => const LoginScreen(),
    );
  }
}
