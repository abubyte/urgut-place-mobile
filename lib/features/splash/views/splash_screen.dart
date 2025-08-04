import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_place/config/routes/routes.dart';
import 'package:urgut_place/core/utils/snackbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void launch() async {
    final result = await InternetAddress.lookup('example.com');
    if (!(result.isEmpty || result[0].rawAddress.isEmpty)) {
      if (!mounted) return;
      context.go(Routes.home);
    } else {
      ToastUi.showError(message: "Iltimos! Internetni tekshiring va sahifani qaytadan yuklang");
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("No Internet")),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/icons/logo.png', height: 100)),
    );
  }
}
