import 'dart:io';

import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/features/explore/models/like/like_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class LikeService {
  Future<List<LikeModel>> getLikes();
  Future<LikeModel> createLike(int shopId);
  Future<void> deleteLike(int shopId);
}

class LikeServiceImpl implements LikeService {
  @override
  Future<List<LikeModel>> getLikes() async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.likes);

      late final List<LikeModel> likes;
      late final List<Map<String, dynamic>> responseJson;
      if (response.data != null) {
        responseJson = response.data;
        likes = responseJson.map((e) => LikeModel.fromJson(e)).toList();
      } else {
        throw ApiException("Likes are not available");
      }

      // Return categories
      return likes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LikeModel> createLike(int shopId) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.likes, data: {"shop_id": shopId});

      late final LikeModel like;
      if (response.data != null) {
        like = LikeModel.fromJson(response.data);
      } else {
        throw ApiException("Couldn't create like");
      }

      // Return categories
      return like;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteLike(int shopId) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      await getIt<ApiService>().deleteRequest(ApiEndpoints.likes, shopId);
    } catch (e) {
      rethrow;
    }
  }
}
