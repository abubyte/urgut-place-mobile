import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shops/config/di.dart';
import 'package:shops/core/errors/api_exception.dart';
import 'package:shops/core/utils/constants.dart';
import 'package:shops/core/utils/extensions.dart';
import 'package:shops/shared/models/shop/shop_model.dart';
import 'package:shops/shared/services/api_service.dart';

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

class ShopServiceImpl implements ShopService {
  @override
  Future<ShopModel> getShop(int shopId) async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (!result.any((r) => r != ConnectivityResult.none)) {
        throw ApiException('No internet connection');
      }

      final response = await getIt<ApiService>().getRequest(ApiEndpoints.shops, id: shopId);

      late final ShopModel shop;
      if (response.data != null) {
        shop = ShopModel.fromJson(response.data);
      } else {
        throw ApiException("Shop is not available");
      }

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
      final result = await Connectivity().checkConnectivity();
      if (!result.any((r) => r != ConnectivityResult.none)) {
        throw ApiException('No internet connection');
      }

      final response = await getIt<ApiService>().getRequest(
        ApiEndpoints.shops,
        queryParameters: {
          if (categoryId != null) "category_id": categoryId,
          if (search != null) "search": search,
          if (sortBy != null) "sort_by": sortBy.name.toSnakeCase(),
          if (sortOrder != null) "sort_order": sortOrder.name,
          if (skip != null) "skip": skip,
          if (limit != null) "limit": limit,
        },
      );

      late final List<ShopModel> shops;
      if (response.data != null) {
        shops = (response.data as List).map((e) => ShopModel.fromJson(e)).toList();
      } else {
        throw ApiException("Shops are not available");
      }

      return shops;
    } catch (e) {
      rethrow;
    }
  }
}

enum SortBy { rating, name, createdAt, likeCount, ratingCount }

enum SortOrder { asc, desc }
