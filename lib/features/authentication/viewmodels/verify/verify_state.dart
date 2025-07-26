import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_state.freezed.dart';

@freezed
abstract class VerifyState with _$VerifyState {
  const factory VerifyState({
    @Default(VerifyStatus.initial) VerifyStatus status,
    String? errorMessage,
    @Default(120) int resendTimer,
    @Default(true) bool canResend,
  }) = _VerifyState;
}

enum VerifyStatus { initial, loading, success, failure, codeSent }
