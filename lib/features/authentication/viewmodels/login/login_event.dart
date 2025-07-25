import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginRequested(String login, String password) = LoginRequested;
  const factory LoginEvent.logoutRequested() = LogoutRequested;
}
