// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsDocumentDto {

@JsonKey(name: 'news_id') String get id; String get title; String get content;@JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime) DateTime get dateline;@JsonKey(name: 'provider_link_page') String get providerLinkPage;
/// Create a copy of NewsDocumentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsDocumentDtoCopyWith<NewsDocumentDto> get copyWith => _$NewsDocumentDtoCopyWithImpl<NewsDocumentDto>(this as NewsDocumentDto, _$identity);

  /// Serializes this NewsDocumentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsDocumentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.dateline, dateline) || other.dateline == dateline)&&(identical(other.providerLinkPage, providerLinkPage) || other.providerLinkPage == providerLinkPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,dateline,providerLinkPage);

@override
String toString() {
  return 'NewsDocumentDto(id: $id, title: $title, content: $content, dateline: $dateline, providerLinkPage: $providerLinkPage)';
}


}

/// @nodoc
abstract mixin class $NewsDocumentDtoCopyWith<$Res>  {
  factory $NewsDocumentDtoCopyWith(NewsDocumentDto value, $Res Function(NewsDocumentDto) _then) = _$NewsDocumentDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'news_id') String id, String title, String content,@JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime) DateTime dateline,@JsonKey(name: 'provider_link_page') String providerLinkPage
});




}
/// @nodoc
class _$NewsDocumentDtoCopyWithImpl<$Res>
    implements $NewsDocumentDtoCopyWith<$Res> {
  _$NewsDocumentDtoCopyWithImpl(this._self, this._then);

  final NewsDocumentDto _self;
  final $Res Function(NewsDocumentDto) _then;

/// Create a copy of NewsDocumentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? dateline = null,Object? providerLinkPage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,dateline: null == dateline ? _self.dateline : dateline // ignore: cast_nullable_to_non_nullable
as DateTime,providerLinkPage: null == providerLinkPage ? _self.providerLinkPage : providerLinkPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsDocumentDto].
extension NewsDocumentDtoPatterns on NewsDocumentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsDocumentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsDocumentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsDocumentDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsDocumentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsDocumentDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsDocumentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'news_id')  String id,  String title,  String content, @JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime)  DateTime dateline, @JsonKey(name: 'provider_link_page')  String providerLinkPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsDocumentDto() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.dateline,_that.providerLinkPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'news_id')  String id,  String title,  String content, @JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime)  DateTime dateline, @JsonKey(name: 'provider_link_page')  String providerLinkPage)  $default,) {final _that = this;
switch (_that) {
case _NewsDocumentDto():
return $default(_that.id,_that.title,_that.content,_that.dateline,_that.providerLinkPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'news_id')  String id,  String title,  String content, @JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime)  DateTime dateline, @JsonKey(name: 'provider_link_page')  String providerLinkPage)?  $default,) {final _that = this;
switch (_that) {
case _NewsDocumentDto() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.dateline,_that.providerLinkPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsDocumentDto implements NewsDocumentDto {
  const _NewsDocumentDto({@JsonKey(name: 'news_id') required this.id, required this.title, required this.content, @JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime) required this.dateline, @JsonKey(name: 'provider_link_page') required this.providerLinkPage});
  factory _NewsDocumentDto.fromJson(Map<String, dynamic> json) => _$NewsDocumentDtoFromJson(json);

@override@JsonKey(name: 'news_id') final  String id;
@override final  String title;
@override final  String content;
@override@JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime) final  DateTime dateline;
@override@JsonKey(name: 'provider_link_page') final  String providerLinkPage;

/// Create a copy of NewsDocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsDocumentDtoCopyWith<_NewsDocumentDto> get copyWith => __$NewsDocumentDtoCopyWithImpl<_NewsDocumentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsDocumentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsDocumentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.dateline, dateline) || other.dateline == dateline)&&(identical(other.providerLinkPage, providerLinkPage) || other.providerLinkPage == providerLinkPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,dateline,providerLinkPage);

@override
String toString() {
  return 'NewsDocumentDto(id: $id, title: $title, content: $content, dateline: $dateline, providerLinkPage: $providerLinkPage)';
}


}

/// @nodoc
abstract mixin class _$NewsDocumentDtoCopyWith<$Res> implements $NewsDocumentDtoCopyWith<$Res> {
  factory _$NewsDocumentDtoCopyWith(_NewsDocumentDto value, $Res Function(_NewsDocumentDto) _then) = __$NewsDocumentDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'news_id') String id, String title, String content,@JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime) DateTime dateline,@JsonKey(name: 'provider_link_page') String providerLinkPage
});




}
/// @nodoc
class __$NewsDocumentDtoCopyWithImpl<$Res>
    implements _$NewsDocumentDtoCopyWith<$Res> {
  __$NewsDocumentDtoCopyWithImpl(this._self, this._then);

  final _NewsDocumentDto _self;
  final $Res Function(_NewsDocumentDto) _then;

/// Create a copy of NewsDocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? dateline = null,Object? providerLinkPage = null,}) {
  return _then(_NewsDocumentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,dateline: null == dateline ? _self.dateline : dateline // ignore: cast_nullable_to_non_nullable
as DateTime,providerLinkPage: null == providerLinkPage ? _self.providerLinkPage : providerLinkPage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
