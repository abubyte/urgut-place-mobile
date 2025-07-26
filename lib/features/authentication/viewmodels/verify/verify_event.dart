import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_event.freezed.dart';

@freezed
abstract class VerifyEvent with _$VerifyEvent {
  const factory VerifyEvent.sendVerification(String login) = SendVerificationRequested;
  const factory VerifyEvent.verifyRequested(String login, String verificationCode) = VerifyRequested;
  const factory VerifyEvent.resendTimerTick(int remainingSeconds) = ResendTimerTick;
  const factory VerifyEvent.resetTimer() = ResetTimer;
}
