import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urgut_place/features/explore/models/category/category_model.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    String? errorMessage,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default({}) Map<int, List<ShopModel>> categoryShops,
    @Default([]) List<ShopModel> featuredShops,
    @Default([]) List<CategoryModel> categories,
  }) = _HomeState;
}

enum HomeStatus { initial, loading, loaded, empty, error }
