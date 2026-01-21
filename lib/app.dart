import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/config/di.dart';
import 'package:shops/config/router.dart';
import 'package:shops/config/app_routes.dart';
import 'package:shops/core/services/app_version_service.dart';
import 'package:shops/core/services/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:shops/core/services/category_service.dart';
import 'package:shops/core/services/like_service.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/features/explore/viewmodels/home/home_bloc.dart';
import 'package:shops/features/explore/viewmodels/like/like_bloc.dart';
import 'package:shops/features/search/viewmodels/search/search_bloc.dart';
import 'package:shops/shared/widgets/force_update_dialog.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? _wasConnected;
  bool _hasCheckedVersion = false;

  @override
  void initState() {
    super.initState();
    _checkAppVersion();
    ConnectivityService.connectivityStream.listen((results) {
      final isConnected = !results.contains(ConnectivityResult.none);
      final prev = _wasConnected;
      _wasConnected = isConnected;

      final ctx = rootNavigatorKey.currentContext;
      if (ctx == null || prev == null || prev == isConnected) return;

      if (!isConnected && prev == true) {
        ctx.go(Routes.noInternet);
      } else if (isConnected && prev == false) {
        ctx.go(Routes.home);
      }
    });
  }

  Future<void> _checkAppVersion() async {
    if (_hasCheckedVersion) return;

    try {
      final appVersionService = getIt<AppVersionService>();
      final shouldUpdate = await appVersionService.shouldForceUpdate();

      if (shouldUpdate) {
        _hasCheckedVersion = true;
        // Wait for the widget tree to be built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final ctx = rootNavigatorKey.currentContext;
          if (ctx != null) {
            showDialog(
              context: ctx,
              barrierDismissible: false,
              builder: (context) => ForceUpdateDialog(appVersionService: appVersionService),
            );
          } else {
            // If context not available, try again after a delay
            Future.delayed(const Duration(milliseconds: 500), () {
              final ctx = rootNavigatorKey.currentContext;
              if (ctx != null) {
                showDialog(
                  context: ctx,
                  barrierDismissible: false,
                  builder: (context) => ForceUpdateDialog(appVersionService: appVersionService),
                );
              }
            });
          }
        });
      } else {
        _hasCheckedVersion = true;
      }
    } catch (e) {
      // Silently fail - don't block app if version check fails
      print('Version check error: $e'); // Debug log
      _hasCheckedVersion = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(getIt<ShopService>(), getIt<CategoryService>())),
        BlocProvider<LikeBloc>(create: (context) => LikeBloc(getIt<LikeService>())),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc(getIt<ShopService>())),
      ],
      child: MaterialApp.router(
        title: 'Urgut Savdo Kompleksi',
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      ),
    );
  }
}
