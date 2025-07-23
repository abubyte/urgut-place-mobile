// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikeModel _$LikeModelFromJson(Map<String, dynamic> json) => _LikeModel(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  shopId: (json['shop_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$LikeModelToJson(_LikeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'shop_id': instance.shopId,
      'created_at': instance.createdAt.toIso8601String(),
    };
