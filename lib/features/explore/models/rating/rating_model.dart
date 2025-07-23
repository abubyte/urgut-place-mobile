import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
abstract class RatingModel with _$RatingModel {
  const factory RatingModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'shop_id') required int shopId,
    required double rating,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}

@freezed
abstract class RatingCreateDto with _$RatingCreateDto {
  const factory RatingCreateDto({@JsonKey(name: 'shop_id') required int shopId, required double rating}) =
      _RatingCreateDto;
}
