import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/services/authentication_service.dart';

class TokenService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveUser(String token, String login, String password) async {
    await _storage.write(key: 'access_token', value: token);
    await _storage.write(key: 'login', value: login);
    await _storage.write(key: 'password', value: password);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: 'access_token');
    final login = await _storage.read(key: 'login');
    final password = await _storage.read(key: 'password');

    if (token != null && JwtDecoder.isExpired(token)) {
      await deleteToken();
      if (login != null && password != null) {
        token = await getIt<AuthenticationService>().login(login, password);
        return token;
      } else {
        return null;
      }
    }

    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'access_token');
  }
}
