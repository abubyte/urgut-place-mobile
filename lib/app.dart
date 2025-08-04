import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_place/config/di/injection.dart';
import 'package:urgut_place/config/routes/app_router.dart';
import 'package:urgut_place/core/services/category_service.dart';
import 'package:urgut_place/core/services/like_service.dart';
import 'package:urgut_place/core/services/shop_service.dart';
import 'package:urgut_place/features/explore/viewmodels/home/home_bloc.dart';
import 'package:urgut_place/features/explore/viewmodels/like/like_bloc.dart';
import 'package:urgut_place/features/search/viewmodels/search/search_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(getIt<ShopService>(), getIt<CategoryService>())),
        BlocProvider<LikeBloc>(create: (context) => LikeBloc(getIt<LikeService>())),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc(getIt<ShopService>())),
      ],
      child: MaterialApp.router(
        title: 'UrgutPlace',
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      ),
    );
  }
}
