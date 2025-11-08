// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => _ShopModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  categoryId: (json['category_id'] as num).toInt(),
  imageUrls:
      (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  sellerPhones:
      (json['seller_phones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  latitude: (json['location_lat'] as num).toDouble(),
  longitude: (json['location_long'] as num).toDouble(),
  sector: (json['sector'] as num?)?.toInt() ?? 0,
  number: (json['number'] as num?)?.toInt() ?? 0,
  saleType: json['sale_type'] as String? ?? 'retail',
  logoUrl: json['logo_url'] as String?,
  socialNetworks:
      (json['social_networks'] as List<dynamic>?)
          ?.map((e) => SocialNetworkModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  isFeatured: json['is_featured'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ShopModelToJson(_ShopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category_id': instance.categoryId,
      'image_urls': instance.imageUrls,
      'seller_phones': instance.sellerPhones,
      'location_lat': instance.latitude,
      'location_long': instance.longitude,
      'sector': instance.sector,
      'number': instance.number,
      'sale_type': instance.saleType,
      'logo_url': instance.logoUrl,
      'social_networks': instance.socialNetworks,
      'is_featured': instance.isFeatured,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
