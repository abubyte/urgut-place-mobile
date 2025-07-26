import 'dart:io';

import 'package:dio/dio.dart';
import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class UserService {
  Future<UserModel> getMe();
  Future<void> deleteUser(int userId);
  Future<UserModel> updateUser({String? firstname, String? lastname, File? image});
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

  @override
  Future<UserModel> updateUser({String? firstname, String? lastname, File? image}) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Prepare form data
      final formData = FormData();

      // Add text fields if provided
      if (firstname != null && firstname.isNotEmpty) {
        formData.fields.add(MapEntry('firstname', firstname));
      }
      if (lastname != null && lastname.isNotEmpty) {
        formData.fields.add(MapEntry('lastname', lastname));
      }

      // Add image file if provided
      if (image != null) {
        final fileName = image.path.split('/').last;
        formData.files.add(MapEntry('image', await MultipartFile.fromFile(image.path, filename: fileName)));
      }

      // Make the request
      final response = await getIt<ApiService>().putFormDataRequest(
        ApiEndpoints.users, // Assuming you have an endpoint for updating current user
        formData: formData,
        id: (await getMe()).id,
      );

      // Parse response
      if (response.data != null) {
        return UserModel.fromJson(response.data["user"]);
      } else {
        throw ApiException("Couldn't update user profile");
      }
    } catch (e) {
      if (e is DioException) {
        // Handle specific Dio errors
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            throw ApiException('Connection timeout. Please try again.');
          case DioExceptionType.badResponse:
            final statusCode = e.response?.statusCode;
            final message = e.response?.data?['message'] ?? 'Server error occurred';
            if (statusCode == 400) {
              throw ApiException('Invalid data provided: $message');
            } else if (statusCode == 401) {
              throw ApiException('Unauthorized. Please login again.');
            } else if (statusCode == 413) {
              throw ApiException('Image file is too large. Please select a smaller image.');
            } else {
              throw ApiException('Server error: $message');
            }
          case DioExceptionType.cancel:
            throw ApiException('Request was cancelled');
          case DioExceptionType.unknown:
            throw ApiException('Network error. Please check your connection.');
          default:
            throw ApiException('An unexpected error occurred');
        }
      }
      rethrow;
    }
  }
}

// Alternative implementation if you need to handle image removal
class UserServiceWithRemoveImpl implements UserService {
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

  @override
  Future<UserModel> updateUser({String? firstname, String? lastname, File? image, bool removeImage = false}) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // If only updating text fields without image changes
      if (image == null && !removeImage) {
        final data = <String, dynamic>{};
        if (firstname != null) data['firstname'] = firstname;
        if (lastname != null) data['lastname'] = lastname;

        final response = await getIt<ApiService>().putRequest(ApiEndpoints.usersMe, data: data);

        if (response.data != null) {
          return UserModel.fromJson(response.data);
        } else {
          throw ApiException("Couldn't update user profile");
        }
      }

      // If updating with image or removing image
      final formData = FormData();

      // Add text fields if provided
      if (firstname != null && firstname.isNotEmpty) {
        formData.fields.add(MapEntry('firstname', firstname));
      }
      if (lastname != null && lastname.isNotEmpty) {
        formData.fields.add(MapEntry('lastname', lastname));
      }

      // Handle image
      if (removeImage) {
        formData.fields.add(const MapEntry('remove_image', 'true'));
      } else if (image != null) {
        final fileName = image.path.split('/').last;
        formData.files.add(MapEntry('image', await MultipartFile.fromFile(image.path, filename: fileName)));
      }

      // Make the request
      final response = await getIt<ApiService>().putRequest(ApiEndpoints.usersMe, data: formData);

      // Parse response
      if (response.data != null) {
        return UserModel.fromJson(response.data);
      } else {
        throw ApiException("Couldn't update user profile");
      }
    } catch (e) {
      if (e is DioException) {
        // Handle specific Dio errors
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            throw ApiException('Connection timeout. Please try again.');
          case DioExceptionType.badResponse:
            final statusCode = e.response?.statusCode;
            final message = e.response?.data?['message'] ?? 'Server error occurred';
            if (statusCode == 400) {
              throw ApiException('Invalid data provided: $message');
            } else if (statusCode == 401) {
              throw ApiException('Unauthorized. Please login again.');
            } else if (statusCode == 413) {
              throw ApiException('Image file is too large. Please select a smaller image.');
            } else {
              throw ApiException('Server error: $message');
            }
          case DioExceptionType.cancel:
            throw ApiException('Request was cancelled');
          case DioExceptionType.unknown:
            throw ApiException('Network error. Please check your connection.');
          default:
            throw ApiException('An unexpected error occurred');
        }
      }
      rethrow;
    }
  }
}
