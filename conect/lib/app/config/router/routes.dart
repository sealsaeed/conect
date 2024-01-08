import 'package:conect/app/config/router/named_routes.dart';
import 'package:conect/app/features_modules/auth/views/login.dart';
import 'package:conect/app/features_modules/auth/views/register.dart';
import 'package:conect/app/features_modules/auth/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation | to use it anywhere to call a class or function without context
final rootNavigatorKey = GlobalKey<NavigatorState>();
final form = GlobalKey<FormState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    //geter
    initialLocation: MyNamedRoutes.root,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        // "state" used to access any route i want
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        // root its a global key to control any screen im calling
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.register}",
        name: MyNamedRoutes.register,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        // root its a global key to control any screen im calling
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.login}",
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router; //geter
}
