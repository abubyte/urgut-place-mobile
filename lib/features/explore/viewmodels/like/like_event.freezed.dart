// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LikeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikeEvent()';
}


}

/// @nodoc
class $LikeEventCopyWith<$Res>  {
$LikeEventCopyWith(LikeEvent _, $Res Function(LikeEvent) __);
}


/// Adds pattern-matching-related methods to [LikeEvent].
extension LikeEventPatterns on LikeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetLikes value)?  getLikes,TResult Function( CreateLike value)?  createLike,TResult Function( DeleteLike value)?  deleteLike,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetLikes() when getLikes != null:
return getLikes(_that);case CreateLike() when createLike != null:
return createLike(_that);case DeleteLike() when deleteLike != null:
return deleteLike(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetLikes value)  getLikes,required TResult Function( CreateLike value)  createLike,required TResult Function( DeleteLike value)  deleteLike,}){
final _that = this;
switch (_that) {
case GetLikes():
return getLikes(_that);case CreateLike():
return createLike(_that);case DeleteLike():
return deleteLike(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetLikes value)?  getLikes,TResult? Function( CreateLike value)?  createLike,TResult? Function( DeleteLike value)?  deleteLike,}){
final _that = this;
switch (_that) {
case GetLikes() when getLikes != null:
return getLikes(_that);case CreateLike() when createLike != null:
return createLike(_that);case DeleteLike() when deleteLike != null:
return deleteLike(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getLikes,TResult Function( int shopId)?  createLike,TResult Function( int shopId)?  deleteLike,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetLikes() when getLikes != null:
return getLikes();case CreateLike() when createLike != null:
return createLike(_that.shopId);case DeleteLike() when deleteLike != null:
return deleteLike(_that.shopId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getLikes,required TResult Function( int shopId)  createLike,required TResult Function( int shopId)  deleteLike,}) {final _that = this;
switch (_that) {
case GetLikes():
return getLikes();case CreateLike():
return createLike(_that.shopId);case DeleteLike():
return deleteLike(_that.shopId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getLikes,TResult? Function( int shopId)?  createLike,TResult? Function( int shopId)?  deleteLike,}) {final _that = this;
switch (_that) {
case GetLikes() when getLikes != null:
return getLikes();case CreateLike() when createLike != null:
return createLike(_that.shopId);case DeleteLike() when deleteLike != null:
return deleteLike(_that.shopId);case _:
  return null;

}
}

}

/// @nodoc


class GetLikes implements LikeEvent {
  const GetLikes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLikes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LikeEvent.getLikes()';
}


}




/// @nodoc


class CreateLike implements LikeEvent {
  const CreateLike(this.shopId);
  

 final  int shopId;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateLikeCopyWith<CreateLike> get copyWith => _$CreateLikeCopyWithImpl<CreateLike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateLike&&(identical(other.shopId, shopId) || other.shopId == shopId));
}


@override
int get hashCode => Object.hash(runtimeType,shopId);

@override
String toString() {
  return 'LikeEvent.createLike(shopId: $shopId)';
}


}

/// @nodoc
abstract mixin class $CreateLikeCopyWith<$Res> implements $LikeEventCopyWith<$Res> {
  factory $CreateLikeCopyWith(CreateLike value, $Res Function(CreateLike) _then) = _$CreateLikeCopyWithImpl;
@useResult
$Res call({
 int shopId
});




}
/// @nodoc
class _$CreateLikeCopyWithImpl<$Res>
    implements $CreateLikeCopyWith<$Res> {
  _$CreateLikeCopyWithImpl(this._self, this._then);

  final CreateLike _self;
  final $Res Function(CreateLike) _then;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shopId = null,}) {
  return _then(CreateLike(
null == shopId ? _self.shopId : shopId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteLike implements LikeEvent {
  const DeleteLike(this.shopId);
  

 final  int shopId;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteLikeCopyWith<DeleteLike> get copyWith => _$DeleteLikeCopyWithImpl<DeleteLike>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteLike&&(identical(other.shopId, shopId) || other.shopId == shopId));
}


@override
int get hashCode => Object.hash(runtimeType,shopId);

@override
String toString() {
  return 'LikeEvent.deleteLike(shopId: $shopId)';
}


}

/// @nodoc
abstract mixin class $DeleteLikeCopyWith<$Res> implements $LikeEventCopyWith<$Res> {
  factory $DeleteLikeCopyWith(DeleteLike value, $Res Function(DeleteLike) _then) = _$DeleteLikeCopyWithImpl;
@useResult
$Res call({
 int shopId
});




}
/// @nodoc
class _$DeleteLikeCopyWithImpl<$Res>
    implements $DeleteLikeCopyWith<$Res> {
  _$DeleteLikeCopyWithImpl(this._self, this._then);

  final DeleteLike _self;
  final $Res Function(DeleteLike) _then;

/// Create a copy of LikeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shopId = null,}) {
  return _then(DeleteLike(
null == shopId ? _self.shopId : shopId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
