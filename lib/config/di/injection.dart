import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgut_please/shared/services/api_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  getIt.registerLazySingleton<ApiService>(() => ApiService()..configureDio(baseUrl: "http://195.200.29.240:8000/"));
}
