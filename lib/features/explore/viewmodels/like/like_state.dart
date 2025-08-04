import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urgut_place/features/explore/models/like/like_model.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';

part 'like_state.freezed.dart';

@freezed
abstract class LikeState with _$LikeState {
  const factory LikeState({
    @Default([]) List<ShopModel> likedShops,
    @Default([]) List<LikeModel> likes,
    @Default([]) List<int> shopIds,
    @Default(LikeStatus.initial) status,
    String? errorMessage,
  }) = _LikeState;
}

enum LikeStatus { initial, loading, success, failure, empty }
