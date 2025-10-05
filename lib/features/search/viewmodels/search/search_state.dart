import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<ShopModel>? result,
    String? errorMessage,
    @Default(true) bool emptyQuery,
    @Default(SearchStatus.initial) SearchStatus status,
    @Default(0) int searchSkip,
    @Default(true) bool searchHasMore,
    @Default(false) bool searchLoading,
  }) = _SearchState;
}

enum SearchStatus { initial, loading, success, failure, empty }
