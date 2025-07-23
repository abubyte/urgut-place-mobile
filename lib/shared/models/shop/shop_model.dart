import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
abstract class ShopModel with _$ShopModel {
  const factory ShopModel({
    required int id,
    required String name,
    @JsonKey(name: 'work_time') required String workTime,
    required String description,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'image_urls') required List<String> imageUrls,
    @JsonKey(name: 'seller_phone') required String sellerPhone,
    required double rating,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'location_lat') required double latitude,
    @JsonKey(name: 'location_long') required double longitude,
    @JsonKey(name: 'location_str') required String landmark,
    @JsonKey(name: 'is_featured') required bool isFeatured,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);

  factory ShopModel.empty() => ShopModel(
    categoryId: 0,
    id: 0,
    name: '',
    workTime: '',
    description: '',
    imageUrls: [],
    sellerPhone: '',
    rating: 0,
    likeCount: 0,
    latitude: 0,
    longitude: 0,
    landmark: '',
    isFeatured: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
