import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_event.freezed.dart';

@freezed
abstract class VerifyEvent with _$VerifyEvent {
  const factory VerifyEvent.verifyRequested(String login, String verificationCode) = VerifyRequested;
}
