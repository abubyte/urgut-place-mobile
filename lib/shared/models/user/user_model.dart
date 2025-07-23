import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String firstname,
    required String lastname,
    required String login,
    required String phone,
    required String email,
    required String role,
    @JsonKey(name: 'is_verified') required bool isVerified,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'last_login') required DateTime lastLogin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
abstract class UserCreateDto with _$UserCreateDto {
  const factory UserCreateDto({
    required String firstname,
    required String lastname,
    required String login,
    String? phone,
    String? email,
    required String password,
  }) = _UserCreateDto;

  factory UserCreateDto.fromJson(Map<String, dynamic> json) => _$UserCreateDtoFromJson(json);
}
