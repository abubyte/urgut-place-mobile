import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_network_model.freezed.dart';
part 'social_network_model.g.dart';

@freezed
abstract class SocialNetworkModel with _$SocialNetworkModel {
  const factory SocialNetworkModel({
    required String type,
    required String url,
  }) = _SocialNetworkModel;

  factory SocialNetworkModel.fromJson(Map<String, dynamic> json) => _$SocialNetworkModelFromJson(json);
}

