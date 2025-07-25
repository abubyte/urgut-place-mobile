import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_state.freezed.dart';

@freezed
abstract class VerifyState with _$VerifyState {
  const factory VerifyState({@Default(VerifyStatus.initial) VerifyStatus status, String? errorMessage}) = _VerifyState;
}

enum VerifyStatus { initial, loading, success, failure }
