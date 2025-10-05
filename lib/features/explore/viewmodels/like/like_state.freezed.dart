// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikeState {

 List<ShopModel> get likedShops; List<String> get shopIds; dynamic get status; String? get errorMessage;
/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeStateCopyWith<LikeState> get copyWith => _$LikeStateCopyWithImpl<LikeState>(this as LikeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeState&&const DeepCollectionEquality().equals(other.likedShops, likedShops)&&const DeepCollectionEquality().equals(other.shopIds, shopIds)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(likedShops),const DeepCollectionEquality().hash(shopIds),const DeepCollectionEquality().hash(status),errorMessage);

@override
String toString() {
  return 'LikeState(likedShops: $likedShops, shopIds: $shopIds, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LikeStateCopyWith<$Res>  {
  factory $LikeStateCopyWith(LikeState value, $Res Function(LikeState) _then) = _$LikeStateCopyWithImpl;
@useResult
$Res call({
 List<ShopModel> likedShops, List<String> shopIds, dynamic status, String? errorMessage
});




}
/// @nodoc
class _$LikeStateCopyWithImpl<$Res>
    implements $LikeStateCopyWith<$Res> {
  _$LikeStateCopyWithImpl(this._self, this._then);

  final LikeState _self;
  final $Res Function(LikeState) _then;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? likedShops = null,Object? shopIds = null,Object? status = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
likedShops: null == likedShops ? _self.likedShops : likedShops // ignore: cast_nullable_to_non_nullable
as List<ShopModel>,shopIds: null == shopIds ? _self.shopIds : shopIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeState].
extension LikeStatePatterns on LikeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeState value)  $default,){
final _that = this;
switch (_that) {
case _LikeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeState value)?  $default,){
final _that = this;
switch (_that) {
case _LikeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ShopModel> likedShops,  List<String> shopIds,  dynamic status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeState() when $default != null:
return $default(_that.likedShops,_that.shopIds,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ShopModel> likedShops,  List<String> shopIds,  dynamic status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LikeState():
return $default(_that.likedShops,_that.shopIds,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ShopModel> likedShops,  List<String> shopIds,  dynamic status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LikeState() when $default != null:
return $default(_that.likedShops,_that.shopIds,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LikeState implements LikeState {
  const _LikeState({final  List<ShopModel> likedShops = const [], final  List<String> shopIds = const [], this.status = LikeStatus.initial, this.errorMessage}): _likedShops = likedShops,_shopIds = shopIds;
  

 final  List<ShopModel> _likedShops;
@override@JsonKey() List<ShopModel> get likedShops {
  if (_likedShops is EqualUnmodifiableListView) return _likedShops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_likedShops);
}

 final  List<String> _shopIds;
@override@JsonKey() List<String> get shopIds {
  if (_shopIds is EqualUnmodifiableListView) return _shopIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shopIds);
}

@override@JsonKey() final  dynamic status;
@override final  String? errorMessage;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeStateCopyWith<_LikeState> get copyWith => __$LikeStateCopyWithImpl<_LikeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeState&&const DeepCollectionEquality().equals(other._likedShops, _likedShops)&&const DeepCollectionEquality().equals(other._shopIds, _shopIds)&&const DeepCollectionEquality().equals(other.status, status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_likedShops),const DeepCollectionEquality().hash(_shopIds),const DeepCollectionEquality().hash(status),errorMessage);

@override
String toString() {
  return 'LikeState(likedShops: $likedShops, shopIds: $shopIds, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LikeStateCopyWith<$Res> implements $LikeStateCopyWith<$Res> {
  factory _$LikeStateCopyWith(_LikeState value, $Res Function(_LikeState) _then) = __$LikeStateCopyWithImpl;
@override @useResult
$Res call({
 List<ShopModel> likedShops, List<String> shopIds, dynamic status, String? errorMessage
});




}
/// @nodoc
class __$LikeStateCopyWithImpl<$Res>
    implements _$LikeStateCopyWith<$Res> {
  __$LikeStateCopyWithImpl(this._self, this._then);

  final _LikeState _self;
  final $Res Function(_LikeState) _then;

/// Create a copy of LikeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? likedShops = null,Object? shopIds = null,Object? status = freezed,Object? errorMessage = freezed,}) {
  return _then(_LikeState(
likedShops: null == likedShops ? _self._likedShops : likedShops // ignore: cast_nullable_to_non_nullable
as List<ShopModel>,shopIds: null == shopIds ? _self._shopIds : shopIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
