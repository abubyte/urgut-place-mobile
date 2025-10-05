import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shops/core/services/category_service.dart';
import 'package:shops/core/services/like_service.dart';
import 'package:shops/core/services/shop_service.dart';
import 'package:shops/shared/services/api_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  getIt.registerLazySingleton<ApiService>(() => ApiService()..configureDio(baseUrl: "http://195.200.29.240:8000/"));
  getIt.registerLazySingleton<ShopService>(() => ShopServiceImpl());
  getIt.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());
  getIt.registerLazySingleton<LikeService>(() => LikeServiceImpl());
}
