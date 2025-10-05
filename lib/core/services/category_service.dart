import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shops/config/di.dart';
import 'package:shops/core/errors/api_exception.dart';
import 'package:shops/core/utils/constants.dart';
import 'package:shops/features/explore/models/category/category_model.dart';
import 'package:shops/shared/services/api_service.dart';

abstract class CategoryService {
  Future<CategoryModel> getCategory(int categoryId);
  Future<List<CategoryModel>> getCategories();
}

class CategoryServiceImpl implements CategoryService {
  @override
  Future<CategoryModel> getCategory(int categoryId) async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (!result.any((r) => r != ConnectivityResult.none)) {
        throw ApiException('No internet connection');
      }

      final response = await getIt<ApiService>().getRequest(ApiEndpoints.categories, id: categoryId);

      late final CategoryModel category;
      if (response.data != null) {
        category = CategoryModel.fromJson(response.data);
      } else {
        throw ApiException("Category is not available");
      }

      return category;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (!result.any((r) => r != ConnectivityResult.none)) {
        throw ApiException('No internet connection');
      }

      final response = await getIt<ApiService>().getRequest(ApiEndpoints.categories);

      late final List<CategoryModel> categories;
      if (response.data != null) {
        categories = (response.data as List).map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw ApiException("Categories are not available");
      }

      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
