import 'dart:io';

import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/shared/models/shop/shop_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class ShopService {
  Future<ShopModel> getShop(int shopId);
  Future<List<ShopModel>> getShops({
    int categoryId,
    String search,
    SortBy sortBy,
    SortOrder sortOrder,
    int skip,
    int limit,
  });
}

class ShopServiceImple implements ShopService {
  @override
  Future<ShopModel> getShop(int shopId) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.shops, id: shopId);

      late final ShopModel shop;
      if (response.data != null) {
        shop = ShopModel.fromJson(response.data);
      } else {
        throw ApiException("Shop is not available");
      }

      // Return shop
      return shop;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ShopModel>> getShops({
    int? categoryId,
    String? search,
    SortBy? sortBy,
    SortOrder? sortOrder,
    int? skip,
    int? limit,
  }) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(
        ApiEndpoints.shops,
        data: {"category_id": categoryId, "search": search, "sort_by": sortBy?.name, "sort_order": sortOrder?.name},
      );

      late final List<ShopModel> shops;
      late final List<Map<String, dynamic>> responseJson;
      if (response.data != null) {
        responseJson = response.data;
        shops = responseJson.map((e) => ShopModel.fromJson(e)).toList();
      } else {
        throw ApiException("Shops are not available");
      }

      // Return shops
      return shops;
    } catch (e) {
      rethrow;
    }
  }
}

enum SortBy { rating, name, createdAt, likeCount, ratingCount }

enum SortOrder { asc, desc }
