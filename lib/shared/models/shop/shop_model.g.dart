// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => _ShopModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  workTime: json['work_time'] as String,
  description: json['description'] as String,
  categoryId: (json['category_id'] as num).toInt(),
  imageUrls: (json['image_urls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  sellerPhone: json['seller_phone'] as String,
  rating: (json['rating'] as num).toDouble(),
  likeCount: (json['like_count'] as num).toInt(),
  latitude: (json['location_lat'] as num).toDouble(),
  longitude: (json['location_long'] as num).toDouble(),
  landmark: json['location_str'] as String,
  isFeatured: json['is_featured'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ShopModelToJson(_ShopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'work_time': instance.workTime,
      'description': instance.description,
      'category_id': instance.categoryId,
      'image_urls': instance.imageUrls,
      'seller_phone': instance.sellerPhone,
      'rating': instance.rating,
      'like_count': instance.likeCount,
      'location_lat': instance.latitude,
      'location_long': instance.longitude,
      'location_str': instance.landmark,
      'is_featured': instance.isFeatured,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
