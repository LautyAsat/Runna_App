import 'package:go_router/go_router.dart';
import 'package:runna/presentation/screens/home_screen.dart';
import 'package:runna/presentation/widgets/auth_wrapper.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => AuthWrapper(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    )
  ]
);