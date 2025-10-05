import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shops/shared/models/shop/shop_model.dart';

part 'like_state.freezed.dart';

@freezed
abstract class LikeState with _$LikeState {
  const factory LikeState({
    @Default([]) List<ShopModel> likedShops,
    @Default([]) List<String> shopIds,
    @Default(LikeStatus.initial) status,
    String? errorMessage,
  }) = _LikeState;
}

enum LikeStatus { initial, loading, success, failure, empty }
