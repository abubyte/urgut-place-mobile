import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urgut_please/shared/models/shop/shop_model.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<ShopModel>? result,
    String? errorMessage,
    @Default(true) bool emptyQuery,
    @Default(SearchStatus.initial) SearchStatus status,
  }) = _SearchState;
}

enum SearchStatus { initial, loading, success, failure, empty }
