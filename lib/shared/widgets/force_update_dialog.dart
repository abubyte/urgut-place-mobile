import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shops/core/services/app_version_service.dart';

class ForceUpdateDialog extends StatelessWidget {
  final AppVersionService appVersionService;

  const ForceUpdateDialog({super.key, required this.appVersionService});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent dismissing
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.system_update, size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(
                'Yangilash talab qilinadi',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FutureBuilder<String>(
                future: appVersionService.getUpdateMessage(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? 'Ilovaning yangi versiyasi mavjud. Iltimos, yangilang.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final updateUrl = await appVersionService.getUpdateUrl();
                    if (updateUrl != null && updateUrl.isNotEmpty) {
                      final uri = Uri.parse(updateUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    } else {
                      // Default app store URLs
                      // You can customize these based on your app store listings
                      final defaultUrl = 'https://play.google.com/store/apps/details?id=uz.urgut24.shops';
                      final uri = Uri.parse(defaultUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Yangilash'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
