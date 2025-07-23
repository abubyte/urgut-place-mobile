import 'dart:io';

import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/errors/api_exception.dart';
import 'package:urgut_please/core/utils/constants.dart';
import 'package:urgut_please/features/explore/models/category/category_model.dart';
import 'package:urgut_please/shared/services/api_service.dart';

abstract class CategoryService {
  Future<CategoryModel> getCategory(int categoryId);
  Future<List<CategoryModel>> getCategories();
}

class CategoryServiceImpl implements CategoryService {
  @override
  Future<CategoryModel> getCategory(int categoryId) async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.categories, id: categoryId);

      late final CategoryModel category;
      if (response.data != null) {
        category = CategoryModel.fromJson(response.data);
      } else {
        throw ApiException("Category is not available");
      }

      // Return category
      return category;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      // Check connection
      final result = await InternetAddress.lookup('example.com');
      if (result.isEmpty || result[0].rawAddress.isEmpty) {
        throw ApiException('No internet connection');
      }

      // Get request
      final response = await getIt<ApiService>().getRequest(ApiEndpoints.categories);

      late final List<CategoryModel> categories;
      late final List<Map<String, dynamic>> responseJson;
      if (response.data != null) {
        responseJson = response.data;
        categories = responseJson.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw ApiException("Categories are not available");
      }

      // Return categories
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
