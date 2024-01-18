import 'package:conect/app/config/router/named_routes.dart';
import 'package:conect/app/features_modules/auth/views/chats_screen.dart';
import 'package:conect/app/features_modules/auth/views/register.dart';
import 'package:conect/app/features_modules/auth/views/splashScreen.dart';
import 'package:conect/app/features_modules/chats/domain/models/user_model.dart';
import 'package:conect/app/features_modules/navbar/views/navbar.scaffold.dart';
import 'package:conect/app/features_modules/navbar/widgets/bottom_navbar.dart';
import 'package:conect/app/features_modules/one_to_one_chat/widget/chat_room_body.dart';
import 'package:conect/app/features_modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///[rootNavigatorKey] used for global | general navigation | to use it anywhere to call a class or function without context
final rootNavigatorKey = GlobalKey<NavigatorState>();
final form = GlobalKey<FormState>();
final shellRouteKey = GlobalKey<NavigatorState>();

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

      ShellRoute(
          navigatorKey: shellRouteKey,
          builder: (context, state, child) {
            return ButtomNavBarScaffold(
              tabs: BottomNavBarTabs.tabs(context),
              child: child,
            );
          },
          routes: [
            GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: "/${MyNamedRoutes.chats}",
                name: MyNamedRoutes.chats,
                pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: const ChatScreen(),
                    ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: "/${MyNamedRoutes.chatDetails}",
                    name: MyNamedRoutes.chatDetails,
                    pageBuilder: (context, state) => NoTransitionPage(
                      key: state.pageKey,
                      child: ChatRoomPageBody(
                        usermodel: state.extra as User,
                      ),
                    ),
                  ),
                ]),
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: "/${MyNamedRoutes.profile}",
              name: MyNamedRoutes.profile,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfileScreen(),
              ),
            ),
          ])
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router; //geter
}
