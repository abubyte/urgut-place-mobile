import 'package:shared_preferences/shared_preferences.dart';
import 'package:shops/config/di.dart';

abstract class LikeService {
  Future<List<String>> getLikes();
  Future<void> createLike(int shopId);
  Future<void> deleteLike(String shopId);
}

class LikeServiceImpl implements LikeService {
  @override
  Future<List<String>> getLikes() async {
    try {
      final List<String> likedShopIds = getIt<SharedPreferences>().getStringList("likedShopIds") ?? [];

      return likedShopIds;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createLike(int shopId) async {
    try {
      final prefs = getIt<SharedPreferences>();
      final likedShopIds = prefs.getStringList("likedShopIds") ?? [];

      final idStr = shopId.toString();
      if (!likedShopIds.contains(idStr)) {
        likedShopIds.add(idStr);
        await prefs.setStringList("likedShopIds", likedShopIds);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteLike(String shopId) async {
    try {
      final prefs = getIt<SharedPreferences>();
      List<String> likedShopIds = prefs.getStringList("likedShopIds") ?? [];
      likedShopIds.remove(shopId);

      await prefs.setStringList("likedShopIds", likedShopIds);
    } catch (e) {
      rethrow;
    }
  }
}
