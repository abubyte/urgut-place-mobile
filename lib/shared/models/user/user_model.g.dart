// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  firstname: json['firstname'] as String,
  lastname: json['lastname'] as String,
  login: json['login'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  isVerified: json['is_verified'] as bool,
  imageUrl: json['image_url'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  lastLogin: DateTime.parse(json['last_login'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'login': instance.login,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'is_verified': instance.isVerified,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'last_login': instance.lastLogin.toIso8601String(),
    };

_UserCreateDto _$UserCreateDtoFromJson(Map<String, dynamic> json) =>
    _UserCreateDto(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      login: json['login'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCreateDtoToJson(_UserCreateDto instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'login': instance.login,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
    };
