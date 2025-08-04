import 'dart:io';

import 'package:urgut_place/config/di/injection.dart';
import 'package:urgut_place/core/errors/api_exception.dart';
import 'package:urgut_place/core/utils/constants.dart';
import 'package:urgut_place/features/explore/models/rating/rating_model.dart';
import 'package:urgut_place/shared/services/api_service.dart';

abstract class RatingService {
  Future<RatingModel> createRating(int shopId, double rating);
  Future<RatingModel> deleteRating(int ratingId);
}

class RatingServiceImple implements RatingService {
  @override
  Future<RatingModel> createRating(int shopId, double rating) async {
    // Check connection
    final result = await InternetAddress.lookup('example.com');
    if (result.isEmpty || result[0].rawAddress.isEmpty) {
      throw ApiException('No internet connection');
    }

    // Create request
    final response = await getIt<ApiService>().postRequest(
      ApiEndpoints.ratings,
      data: {"shop_id": shopId, "rating": rating},
    );

    return RatingModel.fromJson(response.data);
  }

  @override
  Future<RatingModel> deleteRating(int ratingId) async {
    // Check connection
    final result = await InternetAddress.lookup('example.com');
    if (result.isEmpty || result[0].rawAddress.isEmpty) {
      throw ApiException('No internet connection');
    }

    // Create request
    final response = await getIt<ApiService>().deleteRequest(ApiEndpoints.ratings, ratingId);

    return RatingModel.fromJson(response.data);
  }
}
