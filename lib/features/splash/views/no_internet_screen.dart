import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shops/config/app_routes.dart';
import 'package:shops/core/services/connectivity_service.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool _checking = false;

  Future<void> _retry() async {
    setState(() => _checking = true);
    final connected = await ConnectivityService.isConnected();
    if (!mounted) return;
    setState(() => _checking = false);
    if (connected) {
      context.go(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Internet aloqasi yo'q"),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _checking ? null : _retry,
              child: _checking
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Qayta urinish'),
            ),
          ],
        ),
      ),
    );
  }
}
