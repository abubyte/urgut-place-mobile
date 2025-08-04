import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_place/config/routes/routes.dart';
import 'package:urgut_place/features/explore/views/home/home_screen.dart';
import 'package:urgut_place/features/explore/views/like/like_screen.dart';
import 'package:urgut_place/features/explore/views/shop/shop_screen.dart';
import 'package:urgut_place/features/search/views/search/search_screen.dart';
import 'package:urgut_place/features/splash/views/splash_screen.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,

    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(path: Routes.search, builder: (context, state) => SearchScreen()),
          GoRoute(path: Routes.like, builder: (context, state) => LikeScreen()),
          GoRoute(
            path: Routes.shop,
            builder: (context, state) => ShopScreen(shop: state.extra as ShopModel? ?? ShopModel.empty()),
          ),
        ],
      ),
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
