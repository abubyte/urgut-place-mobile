import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({@Default(RegisterStatus.initial) RegisterStatus status, String? errorMessage}) =
      _RegisterState;
}

enum RegisterStatus { initial, loading, success, failure }
