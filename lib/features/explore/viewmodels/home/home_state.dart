import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shops/features/explore/models/category/category_model.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    String? errorMessage,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default({}) Map<int, List<ShopModel>> categoryShops,
    @Default([]) List<ShopModel> featuredShops,
    @Default([]) List<ShopModel> allShops,
    @Default(0) int allSkip,
    @Default(true) bool allHasMore,
    @Default(false) bool allLoading,
    @Default({}) Map<int, int> categorySkip,
    @Default({}) Map<int, bool> categoryHasMore,
    @Default({}) Map<int, bool> categoryLoading,
    @Default([]) List<CategoryModel> categories,
  }) = _HomeState;
}

enum HomeStatus { initial, loading, loaded, empty, error }
