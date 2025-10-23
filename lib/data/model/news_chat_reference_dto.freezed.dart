// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_chat_reference_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsChatReferenceDto {

 String get id; NewsChatReferenceAttributesDto get attributes;
/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsChatReferenceDtoCopyWith<NewsChatReferenceDto> get copyWith => _$NewsChatReferenceDtoCopyWithImpl<NewsChatReferenceDto>(this as NewsChatReferenceDto, _$identity);

  /// Serializes this NewsChatReferenceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsChatReferenceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attributes, attributes) || other.attributes == attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attributes);

@override
String toString() {
  return 'NewsChatReferenceDto(id: $id, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $NewsChatReferenceDtoCopyWith<$Res>  {
  factory $NewsChatReferenceDtoCopyWith(NewsChatReferenceDto value, $Res Function(NewsChatReferenceDto) _then) = _$NewsChatReferenceDtoCopyWithImpl;
@useResult
$Res call({
 String id, NewsChatReferenceAttributesDto attributes
});


$NewsChatReferenceAttributesDtoCopyWith<$Res> get attributes;

}
/// @nodoc
class _$NewsChatReferenceDtoCopyWithImpl<$Res>
    implements $NewsChatReferenceDtoCopyWith<$Res> {
  _$NewsChatReferenceDtoCopyWithImpl(this._self, this._then);

  final NewsChatReferenceDto _self;
  final $Res Function(NewsChatReferenceDto) _then;

/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attributes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as NewsChatReferenceAttributesDto,
  ));
}
/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsChatReferenceAttributesDtoCopyWith<$Res> get attributes {
  
  return $NewsChatReferenceAttributesDtoCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewsChatReferenceDto].
extension NewsChatReferenceDtoPatterns on NewsChatReferenceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsChatReferenceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsChatReferenceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsChatReferenceDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsChatReferenceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsChatReferenceDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsChatReferenceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  NewsChatReferenceAttributesDto attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsChatReferenceDto() when $default != null:
return $default(_that.id,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  NewsChatReferenceAttributesDto attributes)  $default,) {final _that = this;
switch (_that) {
case _NewsChatReferenceDto():
return $default(_that.id,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  NewsChatReferenceAttributesDto attributes)?  $default,) {final _that = this;
switch (_that) {
case _NewsChatReferenceDto() when $default != null:
return $default(_that.id,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsChatReferenceDto implements NewsChatReferenceDto {
  const _NewsChatReferenceDto({required this.id, required this.attributes});
  factory _NewsChatReferenceDto.fromJson(Map<String, dynamic> json) => _$NewsChatReferenceDtoFromJson(json);

@override final  String id;
@override final  NewsChatReferenceAttributesDto attributes;

/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsChatReferenceDtoCopyWith<_NewsChatReferenceDto> get copyWith => __$NewsChatReferenceDtoCopyWithImpl<_NewsChatReferenceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsChatReferenceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsChatReferenceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attributes, attributes) || other.attributes == attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attributes);

@override
String toString() {
  return 'NewsChatReferenceDto(id: $id, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$NewsChatReferenceDtoCopyWith<$Res> implements $NewsChatReferenceDtoCopyWith<$Res> {
  factory _$NewsChatReferenceDtoCopyWith(_NewsChatReferenceDto value, $Res Function(_NewsChatReferenceDto) _then) = __$NewsChatReferenceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, NewsChatReferenceAttributesDto attributes
});


@override $NewsChatReferenceAttributesDtoCopyWith<$Res> get attributes;

}
/// @nodoc
class __$NewsChatReferenceDtoCopyWithImpl<$Res>
    implements _$NewsChatReferenceDtoCopyWith<$Res> {
  __$NewsChatReferenceDtoCopyWithImpl(this._self, this._then);

  final _NewsChatReferenceDto _self;
  final $Res Function(_NewsChatReferenceDto) _then;

/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attributes = null,}) {
  return _then(_NewsChatReferenceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as NewsChatReferenceAttributesDto,
  ));
}

/// Create a copy of NewsChatReferenceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsChatReferenceAttributesDtoCopyWith<$Res> get attributes {
  
  return $NewsChatReferenceAttributesDtoCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// @nodoc
mixin _$NewsChatReferenceAttributesDto {

@JsonKey(name: 'news_id') String get newsId; String get title;@JsonKey(name: 'published_at') DateTime get publishedAt; String get provider; String? get byline;
/// Create a copy of NewsChatReferenceAttributesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsChatReferenceAttributesDtoCopyWith<NewsChatReferenceAttributesDto> get copyWith => _$NewsChatReferenceAttributesDtoCopyWithImpl<NewsChatReferenceAttributesDto>(this as NewsChatReferenceAttributesDto, _$identity);

  /// Serializes this NewsChatReferenceAttributesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsChatReferenceAttributesDto&&(identical(other.newsId, newsId) || other.newsId == newsId)&&(identical(other.title, title) || other.title == title)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.byline, byline) || other.byline == byline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsId,title,publishedAt,provider,byline);

@override
String toString() {
  return 'NewsChatReferenceAttributesDto(newsId: $newsId, title: $title, publishedAt: $publishedAt, provider: $provider, byline: $byline)';
}


}

/// @nodoc
abstract mixin class $NewsChatReferenceAttributesDtoCopyWith<$Res>  {
  factory $NewsChatReferenceAttributesDtoCopyWith(NewsChatReferenceAttributesDto value, $Res Function(NewsChatReferenceAttributesDto) _then) = _$NewsChatReferenceAttributesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'news_id') String newsId, String title,@JsonKey(name: 'published_at') DateTime publishedAt, String provider, String? byline
});




}
/// @nodoc
class _$NewsChatReferenceAttributesDtoCopyWithImpl<$Res>
    implements $NewsChatReferenceAttributesDtoCopyWith<$Res> {
  _$NewsChatReferenceAttributesDtoCopyWithImpl(this._self, this._then);

  final NewsChatReferenceAttributesDto _self;
  final $Res Function(NewsChatReferenceAttributesDto) _then;

/// Create a copy of NewsChatReferenceAttributesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newsId = null,Object? title = null,Object? publishedAt = null,Object? provider = null,Object? byline = freezed,}) {
  return _then(_self.copyWith(
newsId: null == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,byline: freezed == byline ? _self.byline : byline // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsChatReferenceAttributesDto].
extension NewsChatReferenceAttributesDtoPatterns on NewsChatReferenceAttributesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsChatReferenceAttributesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsChatReferenceAttributesDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsChatReferenceAttributesDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'news_id')  String newsId,  String title, @JsonKey(name: 'published_at')  DateTime publishedAt,  String provider,  String? byline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto() when $default != null:
return $default(_that.newsId,_that.title,_that.publishedAt,_that.provider,_that.byline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'news_id')  String newsId,  String title, @JsonKey(name: 'published_at')  DateTime publishedAt,  String provider,  String? byline)  $default,) {final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto():
return $default(_that.newsId,_that.title,_that.publishedAt,_that.provider,_that.byline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'news_id')  String newsId,  String title, @JsonKey(name: 'published_at')  DateTime publishedAt,  String provider,  String? byline)?  $default,) {final _that = this;
switch (_that) {
case _NewsChatReferenceAttributesDto() when $default != null:
return $default(_that.newsId,_that.title,_that.publishedAt,_that.provider,_that.byline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsChatReferenceAttributesDto implements NewsChatReferenceAttributesDto {
  const _NewsChatReferenceAttributesDto({@JsonKey(name: 'news_id') required this.newsId, required this.title, @JsonKey(name: 'published_at') required this.publishedAt, required this.provider, this.byline});
  factory _NewsChatReferenceAttributesDto.fromJson(Map<String, dynamic> json) => _$NewsChatReferenceAttributesDtoFromJson(json);

@override@JsonKey(name: 'news_id') final  String newsId;
@override final  String title;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;
@override final  String provider;
@override final  String? byline;

/// Create a copy of NewsChatReferenceAttributesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsChatReferenceAttributesDtoCopyWith<_NewsChatReferenceAttributesDto> get copyWith => __$NewsChatReferenceAttributesDtoCopyWithImpl<_NewsChatReferenceAttributesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsChatReferenceAttributesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsChatReferenceAttributesDto&&(identical(other.newsId, newsId) || other.newsId == newsId)&&(identical(other.title, title) || other.title == title)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.byline, byline) || other.byline == byline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsId,title,publishedAt,provider,byline);

@override
String toString() {
  return 'NewsChatReferenceAttributesDto(newsId: $newsId, title: $title, publishedAt: $publishedAt, provider: $provider, byline: $byline)';
}


}

/// @nodoc
abstract mixin class _$NewsChatReferenceAttributesDtoCopyWith<$Res> implements $NewsChatReferenceAttributesDtoCopyWith<$Res> {
  factory _$NewsChatReferenceAttributesDtoCopyWith(_NewsChatReferenceAttributesDto value, $Res Function(_NewsChatReferenceAttributesDto) _then) = __$NewsChatReferenceAttributesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'news_id') String newsId, String title,@JsonKey(name: 'published_at') DateTime publishedAt, String provider, String? byline
});




}
/// @nodoc
class __$NewsChatReferenceAttributesDtoCopyWithImpl<$Res>
    implements _$NewsChatReferenceAttributesDtoCopyWith<$Res> {
  __$NewsChatReferenceAttributesDtoCopyWithImpl(this._self, this._then);

  final _NewsChatReferenceAttributesDto _self;
  final $Res Function(_NewsChatReferenceAttributesDto) _then;

/// Create a copy of NewsChatReferenceAttributesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newsId = null,Object? title = null,Object? publishedAt = null,Object? provider = null,Object? byline = freezed,}) {
  return _then(_NewsChatReferenceAttributesDto(
newsId: null == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,byline: freezed == byline ? _self.byline : byline // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
