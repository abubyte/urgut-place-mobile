import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/features/explore/views/home/home_screen.dart';
import 'package:urgut_please/features/explore/views/home/navigation_screen.dart';
import 'package:urgut_please/features/explore/views/shop/widgets/shop_screen.dart';
import 'package:urgut_please/features/profile/views/profile/profile_screen.dart';
import 'package:urgut_please/features/search/views/search/search_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,

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
                  GoRoute(path: Routes.items, builder: (context, state) => ItemsScreen()),
                  GoRoute(path: Routes.shop, builder: (context, state) => ShopScreen()),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.search, builder: (context, state) => const ItemsScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.profile, builder: (context, state) => const ProfileScreen())],
          ),
        ],
      ),
      GoRoute(path: Routes.splash, builder: (context, state) => const SizedBox()),
      GoRoute(path: Routes.login, builder: (context, state) => const SizedBox()),
      GoRoute(path: Routes.register, builder: (context, state) => const SizedBox()),
      GoRoute(path: Routes.verify, builder: (context, state) => const SizedBox()),
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
