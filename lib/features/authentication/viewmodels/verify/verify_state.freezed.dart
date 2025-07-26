// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyState {

 VerifyStatus get status; String? get errorMessage; int get resendTimer; bool get canResend;
/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyStateCopyWith<VerifyState> get copyWith => _$VerifyStateCopyWithImpl<VerifyState>(this as VerifyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendTimer, resendTimer) || other.resendTimer == resendTimer)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,resendTimer,canResend);

@override
String toString() {
  return 'VerifyState(status: $status, errorMessage: $errorMessage, resendTimer: $resendTimer, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class $VerifyStateCopyWith<$Res>  {
  factory $VerifyStateCopyWith(VerifyState value, $Res Function(VerifyState) _then) = _$VerifyStateCopyWithImpl;
@useResult
$Res call({
 VerifyStatus status, String? errorMessage, int resendTimer, bool canResend
});




}
/// @nodoc
class _$VerifyStateCopyWithImpl<$Res>
    implements $VerifyStateCopyWith<$Res> {
  _$VerifyStateCopyWithImpl(this._self, this._then);

  final VerifyState _self;
  final $Res Function(VerifyState) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? resendTimer = null,Object? canResend = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerifyStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendTimer: null == resendTimer ? _self.resendTimer : resendTimer // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyState].
extension VerifyStatePatterns on VerifyState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VerifyStatus status,  String? errorMessage,  int resendTimer,  bool canResend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.resendTimer,_that.canResend);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VerifyStatus status,  String? errorMessage,  int resendTimer,  bool canResend)  $default,) {final _that = this;
switch (_that) {
case _VerifyState():
return $default(_that.status,_that.errorMessage,_that.resendTimer,_that.canResend);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VerifyStatus status,  String? errorMessage,  int resendTimer,  bool canResend)?  $default,) {final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.resendTimer,_that.canResend);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyState implements VerifyState {
  const _VerifyState({this.status = VerifyStatus.initial, this.errorMessage, this.resendTimer = 120, this.canResend = true});
  

@override@JsonKey() final  VerifyStatus status;
@override final  String? errorMessage;
@override@JsonKey() final  int resendTimer;
@override@JsonKey() final  bool canResend;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyStateCopyWith<_VerifyState> get copyWith => __$VerifyStateCopyWithImpl<_VerifyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendTimer, resendTimer) || other.resendTimer == resendTimer)&&(identical(other.canResend, canResend) || other.canResend == canResend));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,resendTimer,canResend);

@override
String toString() {
  return 'VerifyState(status: $status, errorMessage: $errorMessage, resendTimer: $resendTimer, canResend: $canResend)';
}


}

/// @nodoc
abstract mixin class _$VerifyStateCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$VerifyStateCopyWith(_VerifyState value, $Res Function(_VerifyState) _then) = __$VerifyStateCopyWithImpl;
@override @useResult
$Res call({
 VerifyStatus status, String? errorMessage, int resendTimer, bool canResend
});




}
/// @nodoc
class __$VerifyStateCopyWithImpl<$Res>
    implements _$VerifyStateCopyWith<$Res> {
  __$VerifyStateCopyWithImpl(this._self, this._then);

  final _VerifyState _self;
  final $Res Function(_VerifyState) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? resendTimer = null,Object? canResend = null,}) {
  return _then(_VerifyState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VerifyStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendTimer: null == resendTimer ? _self.resendTimer : resendTimer // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
