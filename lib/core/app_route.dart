import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_core_project/core/unknown_route.dart';
import 'package:mvvm_core_project/presentation/view/home/home_view.dart';
import 'package:mvvm_core_project/presentation/view/login/login_view.dart';

class AppRoute {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static const String login = "/login";
  static const String home = "/home";

  static final GoRouter router = GoRouter(
    initialLocation: login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
    ],
    errorBuilder: (context, state) => const UnknownRoute(),
  );
}
