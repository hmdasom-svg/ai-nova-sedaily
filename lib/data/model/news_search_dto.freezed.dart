// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsSearchDto {

@JsonKey(name: 'total_hits') int get totalHits; List<NewsDocumentDto> get documents;
/// Create a copy of NewsSearchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsSearchDtoCopyWith<NewsSearchDto> get copyWith => _$NewsSearchDtoCopyWithImpl<NewsSearchDto>(this as NewsSearchDto, _$identity);

  /// Serializes this NewsSearchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsSearchDto&&(identical(other.totalHits, totalHits) || other.totalHits == totalHits)&&const DeepCollectionEquality().equals(other.documents, documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalHits,const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'NewsSearchDto(totalHits: $totalHits, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $NewsSearchDtoCopyWith<$Res>  {
  factory $NewsSearchDtoCopyWith(NewsSearchDto value, $Res Function(NewsSearchDto) _then) = _$NewsSearchDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_hits') int totalHits, List<NewsDocumentDto> documents
});




}
/// @nodoc
class _$NewsSearchDtoCopyWithImpl<$Res>
    implements $NewsSearchDtoCopyWith<$Res> {
  _$NewsSearchDtoCopyWithImpl(this._self, this._then);

  final NewsSearchDto _self;
  final $Res Function(NewsSearchDto) _then;

/// Create a copy of NewsSearchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalHits = null,Object? documents = null,}) {
  return _then(_self.copyWith(
totalHits: null == totalHits ? _self.totalHits : totalHits // ignore: cast_nullable_to_non_nullable
as int,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<NewsDocumentDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsSearchDto].
extension NewsSearchDtoPatterns on NewsSearchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsSearchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsSearchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsSearchDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsSearchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsSearchDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsSearchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_hits')  int totalHits,  List<NewsDocumentDto> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsSearchDto() when $default != null:
return $default(_that.totalHits,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_hits')  int totalHits,  List<NewsDocumentDto> documents)  $default,) {final _that = this;
switch (_that) {
case _NewsSearchDto():
return $default(_that.totalHits,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_hits')  int totalHits,  List<NewsDocumentDto> documents)?  $default,) {final _that = this;
switch (_that) {
case _NewsSearchDto() when $default != null:
return $default(_that.totalHits,_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsSearchDto implements NewsSearchDto {
  const _NewsSearchDto({@JsonKey(name: 'total_hits') this.totalHits = 0, final  List<NewsDocumentDto> documents = const []}): _documents = documents;
  factory _NewsSearchDto.fromJson(Map<String, dynamic> json) => _$NewsSearchDtoFromJson(json);

@override@JsonKey(name: 'total_hits') final  int totalHits;
 final  List<NewsDocumentDto> _documents;
@override@JsonKey() List<NewsDocumentDto> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of NewsSearchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsSearchDtoCopyWith<_NewsSearchDto> get copyWith => __$NewsSearchDtoCopyWithImpl<_NewsSearchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsSearchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsSearchDto&&(identical(other.totalHits, totalHits) || other.totalHits == totalHits)&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalHits,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'NewsSearchDto(totalHits: $totalHits, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$NewsSearchDtoCopyWith<$Res> implements $NewsSearchDtoCopyWith<$Res> {
  factory _$NewsSearchDtoCopyWith(_NewsSearchDto value, $Res Function(_NewsSearchDto) _then) = __$NewsSearchDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_hits') int totalHits, List<NewsDocumentDto> documents
});




}
/// @nodoc
class __$NewsSearchDtoCopyWithImpl<$Res>
    implements _$NewsSearchDtoCopyWith<$Res> {
  __$NewsSearchDtoCopyWithImpl(this._self, this._then);

  final _NewsSearchDto _self;
  final $Res Function(_NewsSearchDto) _then;

/// Create a copy of NewsSearchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalHits = null,Object? documents = null,}) {
  return _then(_NewsSearchDto(
totalHits: null == totalHits ? _self.totalHits : totalHits // ignore: cast_nullable_to_non_nullable
as int,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<NewsDocumentDto>,
  ));
}


}

// dart format on
