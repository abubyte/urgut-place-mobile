import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/features/authentication/views/login/login_screen.dart';
import 'package:urgut_please/features/authentication/views/register/register_screen.dart';
import 'package:urgut_please/features/authentication/views/verify/verify_screen.dart';
import 'package:urgut_please/features/explore/views/home/home_screen.dart';
import 'package:urgut_please/features/explore/views/home/navigation_screen.dart';
import 'package:urgut_please/features/explore/views/like/like_screen.dart';
import 'package:urgut_please/features/explore/views/shop/widgets/shop_screen.dart';
import 'package:urgut_please/features/profile/views/profile/profile_screen.dart';
import 'package:urgut_please/features/search/views/search/search_screen.dart';
import 'package:urgut_please/features/splash/views/splash_screen.dart';
import 'package:urgut_please/shared/models/shop/shop_model.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavigationScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(path: Routes.like, builder: (context, state) => LikeScreen()),
                  GoRoute(
                    path: Routes.shop,
                    builder: (context, state) => ShopScreen(shop: state.extra as ShopModel? ?? ShopModel.empty()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.search, builder: (context, state) => SearchScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.profile, builder: (context, state) => const ProfileScreen())],
          ),
        ],
      ),
      GoRoute(path: Routes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: Routes.login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (context, state) => const RegisterScreen()),
      GoRoute(path: Routes.verify, builder: (context, state) => const VerifyScreen()),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 0),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
