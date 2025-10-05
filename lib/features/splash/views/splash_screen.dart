import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shops/config/app_routes.dart';
import 'package:shops/core/services/connectivity_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _decideNavigation();
  }

  Future<void> _decideNavigation() async {
    final connected = await ConnectivityService.isConnected();
    if (!mounted) return;
    if (connected) {
      context.go(Routes.home);
    } else {
      context.go(Routes.noInternet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/logo.png', height: 100)),
    );
  }
}
