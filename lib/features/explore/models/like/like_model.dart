import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';

@freezed
abstract class LikeModel with _$LikeModel {
  const factory LikeModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'shop_id') required int shopId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, dynamic> json) => _$LikeModelFromJson(json);
}
