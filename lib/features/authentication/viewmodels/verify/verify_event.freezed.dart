// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEvent {

 String get login; String get verificationCode;
/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEventCopyWith<VerifyEvent> get copyWith => _$VerifyEventCopyWithImpl<VerifyEvent>(this as VerifyEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEvent&&(identical(other.login, login) || other.login == login)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode));
}


@override
int get hashCode => Object.hash(runtimeType,login,verificationCode);

@override
String toString() {
  return 'VerifyEvent(login: $login, verificationCode: $verificationCode)';
}


}

/// @nodoc
abstract mixin class $VerifyEventCopyWith<$Res>  {
  factory $VerifyEventCopyWith(VerifyEvent value, $Res Function(VerifyEvent) _then) = _$VerifyEventCopyWithImpl;
@useResult
$Res call({
 String login, String verificationCode
});




}
/// @nodoc
class _$VerifyEventCopyWithImpl<$Res>
    implements $VerifyEventCopyWith<$Res> {
  _$VerifyEventCopyWithImpl(this._self, this._then);

  final VerifyEvent _self;
  final $Res Function(VerifyEvent) _then;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? login = null,Object? verificationCode = null,}) {
  return _then(_self.copyWith(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,verificationCode: null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyEvent].
extension VerifyEventPatterns on VerifyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerifyRequested value)?  verifyRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerifyRequested value)  verifyRequested,}){
final _that = this;
switch (_that) {
case VerifyRequested():
return verifyRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerifyRequested value)?  verifyRequested,}){
final _that = this;
switch (_that) {
case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String login,  String verificationCode)?  verifyRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that.login,_that.verificationCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String login,  String verificationCode)  verifyRequested,}) {final _that = this;
switch (_that) {
case VerifyRequested():
return verifyRequested(_that.login,_that.verificationCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String login,  String verificationCode)?  verifyRequested,}) {final _that = this;
switch (_that) {
case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that.login,_that.verificationCode);case _:
  return null;

}
}

}

/// @nodoc


class VerifyRequested implements VerifyEvent {
  const VerifyRequested(this.login, this.verificationCode);
  

@override final  String login;
@override final  String verificationCode;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyRequestedCopyWith<VerifyRequested> get copyWith => _$VerifyRequestedCopyWithImpl<VerifyRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyRequested&&(identical(other.login, login) || other.login == login)&&(identical(other.verificationCode, verificationCode) || other.verificationCode == verificationCode));
}


@override
int get hashCode => Object.hash(runtimeType,login,verificationCode);

@override
String toString() {
  return 'VerifyEvent.verifyRequested(login: $login, verificationCode: $verificationCode)';
}


}

/// @nodoc
abstract mixin class $VerifyRequestedCopyWith<$Res> implements $VerifyEventCopyWith<$Res> {
  factory $VerifyRequestedCopyWith(VerifyRequested value, $Res Function(VerifyRequested) _then) = _$VerifyRequestedCopyWithImpl;
@override @useResult
$Res call({
 String login, String verificationCode
});




}
/// @nodoc
class _$VerifyRequestedCopyWithImpl<$Res>
    implements $VerifyRequestedCopyWith<$Res> {
  _$VerifyRequestedCopyWithImpl(this._self, this._then);

  final VerifyRequested _self;
  final $Res Function(VerifyRequested) _then;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? login = null,Object? verificationCode = null,}) {
  return _then(VerifyRequested(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
