import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shops/shared/models/shop/social_network_model.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
abstract class ShopModel with _$ShopModel {
  const factory ShopModel({
    required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'image_urls', defaultValue: <String>[]) required List<String> imageUrls,
    @JsonKey(name: 'seller_phones', defaultValue: <String>[]) required List<String> sellerPhones,
    @JsonKey(name: 'location_lat') required double latitude,
    @JsonKey(name: 'location_long') required double longitude,
    @JsonKey(defaultValue: 0) required int sector,
    @JsonKey(defaultValue: 0) required int number,
    @JsonKey(name: 'sale_type', defaultValue: 'retail') required String saleType,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) required List<SocialNetworkModel> socialNetworks,
    @JsonKey(name: 'is_featured') required bool isFeatured,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);

  factory ShopModel.empty() => ShopModel(
    categoryId: 0,
    id: 0,
    name: '',
    description: '',
    imageUrls: [],
    sellerPhones: [],
    latitude: 0,
    longitude: 0,
    sector: 0,
    number: 0,
    saleType: 'retail',
    logoUrl: null,
    socialNetworks: [],
    isFeatured: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
