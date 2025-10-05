// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchShopsRequested value)?  fetchShopsRequested,TResult Function( FetchAllInitialRequested value)?  fetchAllInitialRequested,TResult Function( LoadMoreAllRequested value)?  loadMoreAllRequested,TResult Function( RefreshAllRequested value)?  refreshAllRequested,TResult Function( FetchCategoryInitialRequested value)?  fetchCategoryInitialRequested,TResult Function( LoadMoreCategoryRequested value)?  loadMoreCategoryRequested,TResult Function( RefreshCategoryRequested value)?  refreshCategoryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchShopsRequested() when fetchShopsRequested != null:
return fetchShopsRequested(_that);case FetchAllInitialRequested() when fetchAllInitialRequested != null:
return fetchAllInitialRequested(_that);case LoadMoreAllRequested() when loadMoreAllRequested != null:
return loadMoreAllRequested(_that);case RefreshAllRequested() when refreshAllRequested != null:
return refreshAllRequested(_that);case FetchCategoryInitialRequested() when fetchCategoryInitialRequested != null:
return fetchCategoryInitialRequested(_that);case LoadMoreCategoryRequested() when loadMoreCategoryRequested != null:
return loadMoreCategoryRequested(_that);case RefreshCategoryRequested() when refreshCategoryRequested != null:
return refreshCategoryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchShopsRequested value)  fetchShopsRequested,required TResult Function( FetchAllInitialRequested value)  fetchAllInitialRequested,required TResult Function( LoadMoreAllRequested value)  loadMoreAllRequested,required TResult Function( RefreshAllRequested value)  refreshAllRequested,required TResult Function( FetchCategoryInitialRequested value)  fetchCategoryInitialRequested,required TResult Function( LoadMoreCategoryRequested value)  loadMoreCategoryRequested,required TResult Function( RefreshCategoryRequested value)  refreshCategoryRequested,}){
final _that = this;
switch (_that) {
case FetchShopsRequested():
return fetchShopsRequested(_that);case FetchAllInitialRequested():
return fetchAllInitialRequested(_that);case LoadMoreAllRequested():
return loadMoreAllRequested(_that);case RefreshAllRequested():
return refreshAllRequested(_that);case FetchCategoryInitialRequested():
return fetchCategoryInitialRequested(_that);case LoadMoreCategoryRequested():
return loadMoreCategoryRequested(_that);case RefreshCategoryRequested():
return refreshCategoryRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchShopsRequested value)?  fetchShopsRequested,TResult? Function( FetchAllInitialRequested value)?  fetchAllInitialRequested,TResult? Function( LoadMoreAllRequested value)?  loadMoreAllRequested,TResult? Function( RefreshAllRequested value)?  refreshAllRequested,TResult? Function( FetchCategoryInitialRequested value)?  fetchCategoryInitialRequested,TResult? Function( LoadMoreCategoryRequested value)?  loadMoreCategoryRequested,TResult? Function( RefreshCategoryRequested value)?  refreshCategoryRequested,}){
final _that = this;
switch (_that) {
case FetchShopsRequested() when fetchShopsRequested != null:
return fetchShopsRequested(_that);case FetchAllInitialRequested() when fetchAllInitialRequested != null:
return fetchAllInitialRequested(_that);case LoadMoreAllRequested() when loadMoreAllRequested != null:
return loadMoreAllRequested(_that);case RefreshAllRequested() when refreshAllRequested != null:
return refreshAllRequested(_that);case FetchCategoryInitialRequested() when fetchCategoryInitialRequested != null:
return fetchCategoryInitialRequested(_that);case LoadMoreCategoryRequested() when loadMoreCategoryRequested != null:
return loadMoreCategoryRequested(_that);case RefreshCategoryRequested() when refreshCategoryRequested != null:
return refreshCategoryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchShopsRequested,TResult Function( int limit)?  fetchAllInitialRequested,TResult Function( int limit)?  loadMoreAllRequested,TResult Function( int limit)?  refreshAllRequested,TResult Function( int categoryId,  int limit)?  fetchCategoryInitialRequested,TResult Function( int categoryId,  int limit)?  loadMoreCategoryRequested,TResult Function( int categoryId,  int limit)?  refreshCategoryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchShopsRequested() when fetchShopsRequested != null:
return fetchShopsRequested();case FetchAllInitialRequested() when fetchAllInitialRequested != null:
return fetchAllInitialRequested(_that.limit);case LoadMoreAllRequested() when loadMoreAllRequested != null:
return loadMoreAllRequested(_that.limit);case RefreshAllRequested() when refreshAllRequested != null:
return refreshAllRequested(_that.limit);case FetchCategoryInitialRequested() when fetchCategoryInitialRequested != null:
return fetchCategoryInitialRequested(_that.categoryId,_that.limit);case LoadMoreCategoryRequested() when loadMoreCategoryRequested != null:
return loadMoreCategoryRequested(_that.categoryId,_that.limit);case RefreshCategoryRequested() when refreshCategoryRequested != null:
return refreshCategoryRequested(_that.categoryId,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchShopsRequested,required TResult Function( int limit)  fetchAllInitialRequested,required TResult Function( int limit)  loadMoreAllRequested,required TResult Function( int limit)  refreshAllRequested,required TResult Function( int categoryId,  int limit)  fetchCategoryInitialRequested,required TResult Function( int categoryId,  int limit)  loadMoreCategoryRequested,required TResult Function( int categoryId,  int limit)  refreshCategoryRequested,}) {final _that = this;
switch (_that) {
case FetchShopsRequested():
return fetchShopsRequested();case FetchAllInitialRequested():
return fetchAllInitialRequested(_that.limit);case LoadMoreAllRequested():
return loadMoreAllRequested(_that.limit);case RefreshAllRequested():
return refreshAllRequested(_that.limit);case FetchCategoryInitialRequested():
return fetchCategoryInitialRequested(_that.categoryId,_that.limit);case LoadMoreCategoryRequested():
return loadMoreCategoryRequested(_that.categoryId,_that.limit);case RefreshCategoryRequested():
return refreshCategoryRequested(_that.categoryId,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchShopsRequested,TResult? Function( int limit)?  fetchAllInitialRequested,TResult? Function( int limit)?  loadMoreAllRequested,TResult? Function( int limit)?  refreshAllRequested,TResult? Function( int categoryId,  int limit)?  fetchCategoryInitialRequested,TResult? Function( int categoryId,  int limit)?  loadMoreCategoryRequested,TResult? Function( int categoryId,  int limit)?  refreshCategoryRequested,}) {final _that = this;
switch (_that) {
case FetchShopsRequested() when fetchShopsRequested != null:
return fetchShopsRequested();case FetchAllInitialRequested() when fetchAllInitialRequested != null:
return fetchAllInitialRequested(_that.limit);case LoadMoreAllRequested() when loadMoreAllRequested != null:
return loadMoreAllRequested(_that.limit);case RefreshAllRequested() when refreshAllRequested != null:
return refreshAllRequested(_that.limit);case FetchCategoryInitialRequested() when fetchCategoryInitialRequested != null:
return fetchCategoryInitialRequested(_that.categoryId,_that.limit);case LoadMoreCategoryRequested() when loadMoreCategoryRequested != null:
return loadMoreCategoryRequested(_that.categoryId,_that.limit);case RefreshCategoryRequested() when refreshCategoryRequested != null:
return refreshCategoryRequested(_that.categoryId,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class FetchShopsRequested implements HomeEvent {
  const FetchShopsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchShopsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.fetchShopsRequested()';
}


}




/// @nodoc


class FetchAllInitialRequested implements HomeEvent {
  const FetchAllInitialRequested({this.limit = 20});
  

@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAllInitialRequestedCopyWith<FetchAllInitialRequested> get copyWith => _$FetchAllInitialRequestedCopyWithImpl<FetchAllInitialRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllInitialRequested&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'HomeEvent.fetchAllInitialRequested(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FetchAllInitialRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $FetchAllInitialRequestedCopyWith(FetchAllInitialRequested value, $Res Function(FetchAllInitialRequested) _then) = _$FetchAllInitialRequestedCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$FetchAllInitialRequestedCopyWithImpl<$Res>
    implements $FetchAllInitialRequestedCopyWith<$Res> {
  _$FetchAllInitialRequestedCopyWithImpl(this._self, this._then);

  final FetchAllInitialRequested _self;
  final $Res Function(FetchAllInitialRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(FetchAllInitialRequested(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadMoreAllRequested implements HomeEvent {
  const LoadMoreAllRequested({this.limit = 20});
  

@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMoreAllRequestedCopyWith<LoadMoreAllRequested> get copyWith => _$LoadMoreAllRequestedCopyWithImpl<LoadMoreAllRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreAllRequested&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'HomeEvent.loadMoreAllRequested(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadMoreAllRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $LoadMoreAllRequestedCopyWith(LoadMoreAllRequested value, $Res Function(LoadMoreAllRequested) _then) = _$LoadMoreAllRequestedCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$LoadMoreAllRequestedCopyWithImpl<$Res>
    implements $LoadMoreAllRequestedCopyWith<$Res> {
  _$LoadMoreAllRequestedCopyWithImpl(this._self, this._then);

  final LoadMoreAllRequested _self;
  final $Res Function(LoadMoreAllRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(LoadMoreAllRequested(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RefreshAllRequested implements HomeEvent {
  const RefreshAllRequested({this.limit = 20});
  

@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshAllRequestedCopyWith<RefreshAllRequested> get copyWith => _$RefreshAllRequestedCopyWithImpl<RefreshAllRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshAllRequested&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'HomeEvent.refreshAllRequested(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $RefreshAllRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $RefreshAllRequestedCopyWith(RefreshAllRequested value, $Res Function(RefreshAllRequested) _then) = _$RefreshAllRequestedCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$RefreshAllRequestedCopyWithImpl<$Res>
    implements $RefreshAllRequestedCopyWith<$Res> {
  _$RefreshAllRequestedCopyWithImpl(this._self, this._then);

  final RefreshAllRequested _self;
  final $Res Function(RefreshAllRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(RefreshAllRequested(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FetchCategoryInitialRequested implements HomeEvent {
  const FetchCategoryInitialRequested({required this.categoryId, this.limit = 20});
  

 final  int categoryId;
@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchCategoryInitialRequestedCopyWith<FetchCategoryInitialRequested> get copyWith => _$FetchCategoryInitialRequestedCopyWithImpl<FetchCategoryInitialRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchCategoryInitialRequested&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,limit);

@override
String toString() {
  return 'HomeEvent.fetchCategoryInitialRequested(categoryId: $categoryId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FetchCategoryInitialRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $FetchCategoryInitialRequestedCopyWith(FetchCategoryInitialRequested value, $Res Function(FetchCategoryInitialRequested) _then) = _$FetchCategoryInitialRequestedCopyWithImpl;
@useResult
$Res call({
 int categoryId, int limit
});




}
/// @nodoc
class _$FetchCategoryInitialRequestedCopyWithImpl<$Res>
    implements $FetchCategoryInitialRequestedCopyWith<$Res> {
  _$FetchCategoryInitialRequestedCopyWithImpl(this._self, this._then);

  final FetchCategoryInitialRequested _self;
  final $Res Function(FetchCategoryInitialRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? limit = null,}) {
  return _then(FetchCategoryInitialRequested(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadMoreCategoryRequested implements HomeEvent {
  const LoadMoreCategoryRequested({required this.categoryId, this.limit = 20});
  

 final  int categoryId;
@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMoreCategoryRequestedCopyWith<LoadMoreCategoryRequested> get copyWith => _$LoadMoreCategoryRequestedCopyWithImpl<LoadMoreCategoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreCategoryRequested&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,limit);

@override
String toString() {
  return 'HomeEvent.loadMoreCategoryRequested(categoryId: $categoryId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadMoreCategoryRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $LoadMoreCategoryRequestedCopyWith(LoadMoreCategoryRequested value, $Res Function(LoadMoreCategoryRequested) _then) = _$LoadMoreCategoryRequestedCopyWithImpl;
@useResult
$Res call({
 int categoryId, int limit
});




}
/// @nodoc
class _$LoadMoreCategoryRequestedCopyWithImpl<$Res>
    implements $LoadMoreCategoryRequestedCopyWith<$Res> {
  _$LoadMoreCategoryRequestedCopyWithImpl(this._self, this._then);

  final LoadMoreCategoryRequested _self;
  final $Res Function(LoadMoreCategoryRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? limit = null,}) {
  return _then(LoadMoreCategoryRequested(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RefreshCategoryRequested implements HomeEvent {
  const RefreshCategoryRequested({required this.categoryId, this.limit = 20});
  

 final  int categoryId;
@JsonKey() final  int limit;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshCategoryRequestedCopyWith<RefreshCategoryRequested> get copyWith => _$RefreshCategoryRequestedCopyWithImpl<RefreshCategoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshCategoryRequested&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,limit);

@override
String toString() {
  return 'HomeEvent.refreshCategoryRequested(categoryId: $categoryId, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $RefreshCategoryRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $RefreshCategoryRequestedCopyWith(RefreshCategoryRequested value, $Res Function(RefreshCategoryRequested) _then) = _$RefreshCategoryRequestedCopyWithImpl;
@useResult
$Res call({
 int categoryId, int limit
});




}
/// @nodoc
class _$RefreshCategoryRequestedCopyWithImpl<$Res>
    implements $RefreshCategoryRequestedCopyWith<$Res> {
  _$RefreshCategoryRequestedCopyWithImpl(this._self, this._then);

  final RefreshCategoryRequested _self;
  final $Res Function(RefreshCategoryRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? limit = null,}) {
  return _then(RefreshCategoryRequested(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
