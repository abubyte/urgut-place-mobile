import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? currentUser,
    @Default(ProfileStatus.initial) ProfileStatus status,
    String? errorMessage,
  }) = _ProfileState;
}

enum ProfileStatus { initial, loading, success, failure }
