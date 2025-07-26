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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEvent()';
}


}

/// @nodoc
class $VerifyEventCopyWith<$Res>  {
$VerifyEventCopyWith(VerifyEvent _, $Res Function(VerifyEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SendVerificationRequested value)?  sendVerification,TResult Function( VerifyRequested value)?  verifyRequested,TResult Function( ResendTimerTick value)?  resendTimerTick,TResult Function( ResetTimer value)?  resetTimer,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SendVerificationRequested() when sendVerification != null:
return sendVerification(_that);case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that);case ResendTimerTick() when resendTimerTick != null:
return resendTimerTick(_that);case ResetTimer() when resetTimer != null:
return resetTimer(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SendVerificationRequested value)  sendVerification,required TResult Function( VerifyRequested value)  verifyRequested,required TResult Function( ResendTimerTick value)  resendTimerTick,required TResult Function( ResetTimer value)  resetTimer,}){
final _that = this;
switch (_that) {
case SendVerificationRequested():
return sendVerification(_that);case VerifyRequested():
return verifyRequested(_that);case ResendTimerTick():
return resendTimerTick(_that);case ResetTimer():
return resetTimer(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SendVerificationRequested value)?  sendVerification,TResult? Function( VerifyRequested value)?  verifyRequested,TResult? Function( ResendTimerTick value)?  resendTimerTick,TResult? Function( ResetTimer value)?  resetTimer,}){
final _that = this;
switch (_that) {
case SendVerificationRequested() when sendVerification != null:
return sendVerification(_that);case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that);case ResendTimerTick() when resendTimerTick != null:
return resendTimerTick(_that);case ResetTimer() when resetTimer != null:
return resetTimer(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String login)?  sendVerification,TResult Function( String login,  String verificationCode)?  verifyRequested,TResult Function( int remainingSeconds)?  resendTimerTick,TResult Function()?  resetTimer,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SendVerificationRequested() when sendVerification != null:
return sendVerification(_that.login);case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that.login,_that.verificationCode);case ResendTimerTick() when resendTimerTick != null:
return resendTimerTick(_that.remainingSeconds);case ResetTimer() when resetTimer != null:
return resetTimer();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String login)  sendVerification,required TResult Function( String login,  String verificationCode)  verifyRequested,required TResult Function( int remainingSeconds)  resendTimerTick,required TResult Function()  resetTimer,}) {final _that = this;
switch (_that) {
case SendVerificationRequested():
return sendVerification(_that.login);case VerifyRequested():
return verifyRequested(_that.login,_that.verificationCode);case ResendTimerTick():
return resendTimerTick(_that.remainingSeconds);case ResetTimer():
return resetTimer();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String login)?  sendVerification,TResult? Function( String login,  String verificationCode)?  verifyRequested,TResult? Function( int remainingSeconds)?  resendTimerTick,TResult? Function()?  resetTimer,}) {final _that = this;
switch (_that) {
case SendVerificationRequested() when sendVerification != null:
return sendVerification(_that.login);case VerifyRequested() when verifyRequested != null:
return verifyRequested(_that.login,_that.verificationCode);case ResendTimerTick() when resendTimerTick != null:
return resendTimerTick(_that.remainingSeconds);case ResetTimer() when resetTimer != null:
return resetTimer();case _:
  return null;

}
}

}

/// @nodoc


class SendVerificationRequested implements VerifyEvent {
  const SendVerificationRequested(this.login);
  

 final  String login;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendVerificationRequestedCopyWith<SendVerificationRequested> get copyWith => _$SendVerificationRequestedCopyWithImpl<SendVerificationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendVerificationRequested&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'VerifyEvent.sendVerification(login: $login)';
}


}

/// @nodoc
abstract mixin class $SendVerificationRequestedCopyWith<$Res> implements $VerifyEventCopyWith<$Res> {
  factory $SendVerificationRequestedCopyWith(SendVerificationRequested value, $Res Function(SendVerificationRequested) _then) = _$SendVerificationRequestedCopyWithImpl;
@useResult
$Res call({
 String login
});




}
/// @nodoc
class _$SendVerificationRequestedCopyWithImpl<$Res>
    implements $SendVerificationRequestedCopyWith<$Res> {
  _$SendVerificationRequestedCopyWithImpl(this._self, this._then);

  final SendVerificationRequested _self;
  final $Res Function(SendVerificationRequested) _then;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(SendVerificationRequested(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VerifyRequested implements VerifyEvent {
  const VerifyRequested(this.login, this.verificationCode);
  

 final  String login;
 final  String verificationCode;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? login = null,Object? verificationCode = null,}) {
  return _then(VerifyRequested(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,null == verificationCode ? _self.verificationCode : verificationCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResendTimerTick implements VerifyEvent {
  const ResendTimerTick(this.remainingSeconds);
  

 final  int remainingSeconds;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendTimerTickCopyWith<ResendTimerTick> get copyWith => _$ResendTimerTickCopyWithImpl<ResendTimerTick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendTimerTick&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds);

@override
String toString() {
  return 'VerifyEvent.resendTimerTick(remainingSeconds: $remainingSeconds)';
}


}

/// @nodoc
abstract mixin class $ResendTimerTickCopyWith<$Res> implements $VerifyEventCopyWith<$Res> {
  factory $ResendTimerTickCopyWith(ResendTimerTick value, $Res Function(ResendTimerTick) _then) = _$ResendTimerTickCopyWithImpl;
@useResult
$Res call({
 int remainingSeconds
});




}
/// @nodoc
class _$ResendTimerTickCopyWithImpl<$Res>
    implements $ResendTimerTickCopyWith<$Res> {
  _$ResendTimerTickCopyWithImpl(this._self, this._then);

  final ResendTimerTick _self;
  final $Res Function(ResendTimerTick) _then;

/// Create a copy of VerifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remainingSeconds = null,}) {
  return _then(ResendTimerTick(
null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetTimer implements VerifyEvent {
  const ResetTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEvent.resetTimer()';
}


}




// dart format on
