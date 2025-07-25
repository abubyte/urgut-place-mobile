import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({@Default(LoginStatus.initial) LoginStatus status, String? errorMessage}) = _LoginState;
}

enum LoginStatus { initial, loading, success, failure }
