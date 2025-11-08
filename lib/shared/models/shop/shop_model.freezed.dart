// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopModel {

 int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'category_id') int get categoryId;@JsonKey(name: 'image_urls', defaultValue: <String>[]) List<String> get imageUrls;@JsonKey(name: 'seller_phones', defaultValue: <String>[]) List<String> get sellerPhones;@JsonKey(name: 'location_lat') double get latitude;@JsonKey(name: 'location_long') double get longitude;@JsonKey(defaultValue: 0) int get sector;@JsonKey(defaultValue: 0) int get number;@JsonKey(name: 'sale_type', defaultValue: 'retail') String get saleType;@JsonKey(name: 'logo_url') String? get logoUrl;@JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) List<SocialNetworkModel> get socialNetworks;@JsonKey(name: 'is_featured') bool get isFeatured;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopModelCopyWith<ShopModel> get copyWith => _$ShopModelCopyWithImpl<ShopModel>(this as ShopModel, _$identity);

  /// Serializes this ShopModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.sellerPhones, sellerPhones)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.number, number) || other.number == number)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other.socialNetworks, socialNetworks)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,categoryId,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(sellerPhones),latitude,longitude,sector,number,saleType,logoUrl,const DeepCollectionEquality().hash(socialNetworks),isFeatured,createdAt,updatedAt);

@override
String toString() {
  return 'ShopModel(id: $id, name: $name, description: $description, categoryId: $categoryId, imageUrls: $imageUrls, sellerPhones: $sellerPhones, latitude: $latitude, longitude: $longitude, sector: $sector, number: $number, saleType: $saleType, logoUrl: $logoUrl, socialNetworks: $socialNetworks, isFeatured: $isFeatured, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShopModelCopyWith<$Res>  {
  factory $ShopModelCopyWith(ShopModel value, $Res Function(ShopModel) _then) = _$ShopModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'image_urls', defaultValue: <String>[]) List<String> imageUrls,@JsonKey(name: 'seller_phones', defaultValue: <String>[]) List<String> sellerPhones,@JsonKey(name: 'location_lat') double latitude,@JsonKey(name: 'location_long') double longitude,@JsonKey(defaultValue: 0) int sector,@JsonKey(defaultValue: 0) int number,@JsonKey(name: 'sale_type', defaultValue: 'retail') String saleType,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) List<SocialNetworkModel> socialNetworks,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ShopModelCopyWithImpl<$Res>
    implements $ShopModelCopyWith<$Res> {
  _$ShopModelCopyWithImpl(this._self, this._then);

  final ShopModel _self;
  final $Res Function(ShopModel) _then;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? categoryId = null,Object? imageUrls = null,Object? sellerPhones = null,Object? latitude = null,Object? longitude = null,Object? sector = null,Object? number = null,Object? saleType = null,Object? logoUrl = freezed,Object? socialNetworks = null,Object? isFeatured = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,sellerPhones: null == sellerPhones ? _self.sellerPhones : sellerPhones // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,socialNetworks: null == socialNetworks ? _self.socialNetworks : socialNetworks // ignore: cast_nullable_to_non_nullable
as List<SocialNetworkModel>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopModel].
extension ShopModelPatterns on ShopModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopModel value)  $default,){
final _that = this;
switch (_that) {
case _ShopModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_urls', defaultValue: <String>[])  List<String> imageUrls, @JsonKey(name: 'seller_phones', defaultValue: <String>[])  List<String> sellerPhones, @JsonKey(name: 'location_lat')  double latitude, @JsonKey(name: 'location_long')  double longitude, @JsonKey(defaultValue: 0)  int sector, @JsonKey(defaultValue: 0)  int number, @JsonKey(name: 'sale_type', defaultValue: 'retail')  String saleType, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[])  List<SocialNetworkModel> socialNetworks, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.categoryId,_that.imageUrls,_that.sellerPhones,_that.latitude,_that.longitude,_that.sector,_that.number,_that.saleType,_that.logoUrl,_that.socialNetworks,_that.isFeatured,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_urls', defaultValue: <String>[])  List<String> imageUrls, @JsonKey(name: 'seller_phones', defaultValue: <String>[])  List<String> sellerPhones, @JsonKey(name: 'location_lat')  double latitude, @JsonKey(name: 'location_long')  double longitude, @JsonKey(defaultValue: 0)  int sector, @JsonKey(defaultValue: 0)  int number, @JsonKey(name: 'sale_type', defaultValue: 'retail')  String saleType, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[])  List<SocialNetworkModel> socialNetworks, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ShopModel():
return $default(_that.id,_that.name,_that.description,_that.categoryId,_that.imageUrls,_that.sellerPhones,_that.latitude,_that.longitude,_that.sector,_that.number,_that.saleType,_that.logoUrl,_that.socialNetworks,_that.isFeatured,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_urls', defaultValue: <String>[])  List<String> imageUrls, @JsonKey(name: 'seller_phones', defaultValue: <String>[])  List<String> sellerPhones, @JsonKey(name: 'location_lat')  double latitude, @JsonKey(name: 'location_long')  double longitude, @JsonKey(defaultValue: 0)  int sector, @JsonKey(defaultValue: 0)  int number, @JsonKey(name: 'sale_type', defaultValue: 'retail')  String saleType, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[])  List<SocialNetworkModel> socialNetworks, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.categoryId,_that.imageUrls,_that.sellerPhones,_that.latitude,_that.longitude,_that.sector,_that.number,_that.saleType,_that.logoUrl,_that.socialNetworks,_that.isFeatured,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShopModel implements ShopModel {
  const _ShopModel({required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'image_urls', defaultValue: <String>[]) required final  List<String> imageUrls, @JsonKey(name: 'seller_phones', defaultValue: <String>[]) required final  List<String> sellerPhones, @JsonKey(name: 'location_lat') required this.latitude, @JsonKey(name: 'location_long') required this.longitude, @JsonKey(defaultValue: 0) required this.sector, @JsonKey(defaultValue: 0) required this.number, @JsonKey(name: 'sale_type', defaultValue: 'retail') required this.saleType, @JsonKey(name: 'logo_url') this.logoUrl, @JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) required final  List<SocialNetworkModel> socialNetworks, @JsonKey(name: 'is_featured') required this.isFeatured, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _imageUrls = imageUrls,_sellerPhones = sellerPhones,_socialNetworks = socialNetworks;
  factory _ShopModel.fromJson(Map<String, dynamic> json) => _$ShopModelFromJson(json);

@override final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(name: 'category_id') final  int categoryId;
 final  List<String> _imageUrls;
@override@JsonKey(name: 'image_urls', defaultValue: <String>[]) List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<String> _sellerPhones;
@override@JsonKey(name: 'seller_phones', defaultValue: <String>[]) List<String> get sellerPhones {
  if (_sellerPhones is EqualUnmodifiableListView) return _sellerPhones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sellerPhones);
}

@override@JsonKey(name: 'location_lat') final  double latitude;
@override@JsonKey(name: 'location_long') final  double longitude;
@override@JsonKey(defaultValue: 0) final  int sector;
@override@JsonKey(defaultValue: 0) final  int number;
@override@JsonKey(name: 'sale_type', defaultValue: 'retail') final  String saleType;
@override@JsonKey(name: 'logo_url') final  String? logoUrl;
 final  List<SocialNetworkModel> _socialNetworks;
@override@JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) List<SocialNetworkModel> get socialNetworks {
  if (_socialNetworks is EqualUnmodifiableListView) return _socialNetworks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socialNetworks);
}

@override@JsonKey(name: 'is_featured') final  bool isFeatured;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopModelCopyWith<_ShopModel> get copyWith => __$ShopModelCopyWithImpl<_ShopModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShopModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._sellerPhones, _sellerPhones)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.number, number) || other.number == number)&&(identical(other.saleType, saleType) || other.saleType == saleType)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other._socialNetworks, _socialNetworks)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,categoryId,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_sellerPhones),latitude,longitude,sector,number,saleType,logoUrl,const DeepCollectionEquality().hash(_socialNetworks),isFeatured,createdAt,updatedAt);

@override
String toString() {
  return 'ShopModel(id: $id, name: $name, description: $description, categoryId: $categoryId, imageUrls: $imageUrls, sellerPhones: $sellerPhones, latitude: $latitude, longitude: $longitude, sector: $sector, number: $number, saleType: $saleType, logoUrl: $logoUrl, socialNetworks: $socialNetworks, isFeatured: $isFeatured, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShopModelCopyWith<$Res> implements $ShopModelCopyWith<$Res> {
  factory _$ShopModelCopyWith(_ShopModel value, $Res Function(_ShopModel) _then) = __$ShopModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'image_urls', defaultValue: <String>[]) List<String> imageUrls,@JsonKey(name: 'seller_phones', defaultValue: <String>[]) List<String> sellerPhones,@JsonKey(name: 'location_lat') double latitude,@JsonKey(name: 'location_long') double longitude,@JsonKey(defaultValue: 0) int sector,@JsonKey(defaultValue: 0) int number,@JsonKey(name: 'sale_type', defaultValue: 'retail') String saleType,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'social_networks', defaultValue: <SocialNetworkModel>[]) List<SocialNetworkModel> socialNetworks,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ShopModelCopyWithImpl<$Res>
    implements _$ShopModelCopyWith<$Res> {
  __$ShopModelCopyWithImpl(this._self, this._then);

  final _ShopModel _self;
  final $Res Function(_ShopModel) _then;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? categoryId = null,Object? imageUrls = null,Object? sellerPhones = null,Object? latitude = null,Object? longitude = null,Object? sector = null,Object? number = null,Object? saleType = null,Object? logoUrl = freezed,Object? socialNetworks = null,Object? isFeatured = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ShopModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,sellerPhones: null == sellerPhones ? _self._sellerPhones : sellerPhones // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,saleType: null == saleType ? _self.saleType : saleType // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,socialNetworks: null == socialNetworks ? _self._socialNetworks : socialNetworks // ignore: cast_nullable_to_non_nullable
as List<SocialNetworkModel>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
