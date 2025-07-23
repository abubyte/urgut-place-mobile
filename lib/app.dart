import 'package:flutter/material.dart';
import 'package:urgut_please/config/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    // providers: [BlocProvider<>(create: (context) => 0)],
    // child:
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      // ),
    );
  }
}
