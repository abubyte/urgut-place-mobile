// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_network_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialNetworkModel {

 String get type; String get url;
/// Create a copy of SocialNetworkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialNetworkModelCopyWith<SocialNetworkModel> get copyWith => _$SocialNetworkModelCopyWithImpl<SocialNetworkModel>(this as SocialNetworkModel, _$identity);

  /// Serializes this SocialNetworkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialNetworkModel&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'SocialNetworkModel(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class $SocialNetworkModelCopyWith<$Res>  {
  factory $SocialNetworkModelCopyWith(SocialNetworkModel value, $Res Function(SocialNetworkModel) _then) = _$SocialNetworkModelCopyWithImpl;
@useResult
$Res call({
 String type, String url
});




}
/// @nodoc
class _$SocialNetworkModelCopyWithImpl<$Res>
    implements $SocialNetworkModelCopyWith<$Res> {
  _$SocialNetworkModelCopyWithImpl(this._self, this._then);

  final SocialNetworkModel _self;
  final $Res Function(SocialNetworkModel) _then;

/// Create a copy of SocialNetworkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? url = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialNetworkModel].
extension SocialNetworkModelPatterns on SocialNetworkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialNetworkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialNetworkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialNetworkModel value)  $default,){
final _that = this;
switch (_that) {
case _SocialNetworkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialNetworkModel value)?  $default,){
final _that = this;
switch (_that) {
case _SocialNetworkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialNetworkModel() when $default != null:
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String url)  $default,) {final _that = this;
switch (_that) {
case _SocialNetworkModel():
return $default(_that.type,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String url)?  $default,) {final _that = this;
switch (_that) {
case _SocialNetworkModel() when $default != null:
return $default(_that.type,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialNetworkModel implements SocialNetworkModel {
  const _SocialNetworkModel({required this.type, required this.url});
  factory _SocialNetworkModel.fromJson(Map<String, dynamic> json) => _$SocialNetworkModelFromJson(json);

@override final  String type;
@override final  String url;

/// Create a copy of SocialNetworkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialNetworkModelCopyWith<_SocialNetworkModel> get copyWith => __$SocialNetworkModelCopyWithImpl<_SocialNetworkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialNetworkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialNetworkModel&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url);

@override
String toString() {
  return 'SocialNetworkModel(type: $type, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SocialNetworkModelCopyWith<$Res> implements $SocialNetworkModelCopyWith<$Res> {
  factory _$SocialNetworkModelCopyWith(_SocialNetworkModel value, $Res Function(_SocialNetworkModel) _then) = __$SocialNetworkModelCopyWithImpl;
@override @useResult
$Res call({
 String type, String url
});




}
/// @nodoc
class __$SocialNetworkModelCopyWithImpl<$Res>
    implements _$SocialNetworkModelCopyWith<$Res> {
  __$SocialNetworkModelCopyWithImpl(this._self, this._then);

  final _SocialNetworkModel _self;
  final $Res Function(_SocialNetworkModel) _then;

/// Create a copy of SocialNetworkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? url = null,}) {
  return _then(_SocialNetworkModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
