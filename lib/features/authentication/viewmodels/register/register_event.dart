import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';

part 'register_event.freezed.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.registerRequested(UserCreateDto data) = RegisterRequested;
}
