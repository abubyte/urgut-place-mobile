import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_event.freezed.dart';

@freezed
abstract class LikeEvent with _$LikeEvent {
  const factory LikeEvent.getLikes() = GetLikes;
  const factory LikeEvent.createLike(int shopId) = CreateLike;
  const factory LikeEvent.deleteLike(int shopId) = DeleteLike;
}
