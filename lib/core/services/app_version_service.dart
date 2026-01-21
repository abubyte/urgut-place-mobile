import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shops/config/di.dart';
import 'package:shops/core/utils/constants.dart';
import 'package:shops/shared/services/api_service.dart';

class AppVersionInfo {
  final String minimumVersion;
  final int? minimumBuild;
  final bool forceUpdate;
  final String? updateMessage;
  final String? updateUrl;

  AppVersionInfo({
    required this.minimumVersion,
    this.minimumBuild,
    required this.forceUpdate,
    this.updateMessage,
    this.updateUrl,
  });

  factory AppVersionInfo.fromJson(Map<String, dynamic> json) {
    return AppVersionInfo(
      minimumVersion: json['minimum_version'] as String,
      minimumBuild: json['minimum_build'] as int?,
      forceUpdate: json['force_update'] as bool? ?? false,
      updateMessage: json['update_message'] as String?,
      updateUrl: json['update_url'] as String?,
    );
  }
}

abstract class AppVersionService {
  Future<AppVersionInfo> getMinimumVersion();
  Future<bool> shouldForceUpdate();
  Future<String?> getUpdateUrl();
  Future<String> getUpdateMessage();
}

class AppVersionServiceImpl implements AppVersionService {
  @override
  Future<AppVersionInfo> getMinimumVersion() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (!result.any((r) => r != ConnectivityResult.none)) {
        // If no internet, return default that won't force update
        return AppVersionInfo(minimumVersion: '0.0.0', forceUpdate: false);
      }

      final platform = Platform.isAndroid ? 'android' : 'ios';
      final response = await getIt<ApiService>().getRequest('${ApiEndpoints.appVersion}/$platform');

      if (response.data != null) {
        return AppVersionInfo.fromJson(response.data);
      } else {
        // Default: no force update
        return AppVersionInfo(minimumVersion: '0.0.0', forceUpdate: false);
      }
    } catch (e) {
      // On error, don't force update
      return AppVersionInfo(minimumVersion: '0.0.0', forceUpdate: false);
    }
  }

  @override
  Future<bool> shouldForceUpdate() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final currentBuild = int.tryParse(packageInfo.buildNumber) ?? 0;

      final minVersionInfo = await getMinimumVersion();

      print('🔍 Version Check:');
      print('  Current: $currentVersion+$currentBuild');
      print('  Minimum: ${minVersionInfo.minimumVersion}+${minVersionInfo.minimumBuild}');
      print('  Force Update: ${minVersionInfo.forceUpdate}');

      if (!minVersionInfo.forceUpdate) {
        print('  ❌ Force update disabled, skipping');
        return false;
      }

      // Compare versions
      final currentVersionParts = currentVersion.split('.').map(int.parse).toList();
      final minVersionParts = minVersionInfo.minimumVersion.split('.').map(int.parse).toList();

      // Ensure both have 3 parts
      while (currentVersionParts.length < 3) currentVersionParts.add(0);
      while (minVersionParts.length < 3) minVersionParts.add(0);

      // Compare major, minor, patch
      for (int i = 0; i < 3; i++) {
        if (currentVersionParts[i] < minVersionParts[i]) {
          print('  ✅ Update needed: version part $i (${currentVersionParts[i]} < ${minVersionParts[i]})');
          return true;
        } else if (currentVersionParts[i] > minVersionParts[i]) {
          print('  ❌ No update needed: version part $i (${currentVersionParts[i]} > ${minVersionParts[i]})');
          return false;
        }
      }

      // If versions are equal, check build number
      if (minVersionInfo.minimumBuild != null) {
        final needsUpdate = currentBuild < minVersionInfo.minimumBuild!;
        if (needsUpdate) {
          print('  ✅ Update needed: build number ($currentBuild < ${minVersionInfo.minimumBuild})');
        } else {
          print('  ❌ No update needed: build number ($currentBuild >= ${minVersionInfo.minimumBuild})');
        }
        return needsUpdate;
      }

      print('  ❌ No update needed: versions match, no build requirement');
      return false;
    } catch (e) {
      // On error, don't force update
      return false;
    }
  }

  @override
  Future<String?> getUpdateUrl() async {
    final minVersionInfo = await getMinimumVersion();
    return minVersionInfo.updateUrl;
  }

  @override
  Future<String> getUpdateMessage() async {
    final minVersionInfo = await getMinimumVersion();
    return minVersionInfo.updateMessage ?? 'Ilovaning yangi versiyasi mavjud. Iltimos, yangilang.';
  }
}
