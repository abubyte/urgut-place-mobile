import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/config/routes/app_router.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/services/category_service.dart';
import 'package:urgut_please/core/services/like_service.dart';
import 'package:urgut_please/core/services/shop_service.dart';
import 'package:urgut_please/core/services/user_service.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/like/like_bloc.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_bloc.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_bloc.dart';
import 'package:urgut_please/features/search/viewmodels/search/search_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(getIt<AuthenticationService>())),
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(getIt<AuthenticationService>())),
        BlocProvider<VerifyBloc>(create: (context) => VerifyBloc(getIt<AuthenticationService>())),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(getIt<ShopService>(), getIt<CategoryService>())),
        BlocProvider<LikeBloc>(create: (context) => LikeBloc(getIt<LikeService>())),
        BlocProvider<SearchBloc>(create: (context) => SearchBloc(getIt<ShopService>())),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(getIt<UserService>())),
        BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc(getIt<UserService>())),
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
