import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shops/config/app_routes.dart';
import 'package:shops/features/explore/views/home/home_screen.dart';
import 'package:shops/features/explore/views/like/like_screen.dart';
import 'package:shops/features/explore/views/shop/shop_screen.dart';
import 'package:shops/features/search/views/search/search_screen.dart';
import 'package:shops/features/splash/views/splash_screen.dart';
import 'package:shops/features/splash/views/no_internet_screen.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> sectionNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'section',
);

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,

    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.noInternet,
        builder: (context, state) => const NoInternetScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: Routes.search,
            builder: (context, state) => SearchScreen(),
          ),
          GoRoute(path: Routes.like, builder: (context, state) => LikeScreen()),
          GoRoute(
            path: Routes.shop,
            builder: (context, state) => ShopScreen(
              shop: state.extra as ShopModel? ?? ShopModel.empty(),
            ),
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
