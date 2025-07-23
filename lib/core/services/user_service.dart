import 'dart:io';

import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class UserService {
  Future<UserModel> getMe();
  Future<void> deleteUser(int userId);
}

class UserServiceImpl implements UserService {
  @override
  Future<UserModel> getMe() async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.usersMe);
      late final UserModel user;
      if (response.data != null) {
        user = UserModel.fromJson(response.data);
      } else {
        throw ApiException("Couldn't get current user");
      }

      // Return User
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(int userId) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Delete request
      await getIt<ApiService>().deleteRequest(ApiEndpoints.users, userId);
    } catch (e) {
      rethrow;
    }
  }
}
