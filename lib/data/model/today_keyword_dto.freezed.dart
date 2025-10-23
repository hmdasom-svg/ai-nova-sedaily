// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_keyword_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayKeywordDto {

@JsonKey(name: 'search_date') String get searchDate;@JsonKey(name: 'keywords') List<KeywordEntryDto> get keywords;
/// Create a copy of TodayKeywordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayKeywordDtoCopyWith<TodayKeywordDto> get copyWith => _$TodayKeywordDtoCopyWithImpl<TodayKeywordDto>(this as TodayKeywordDto, _$identity);

  /// Serializes this TodayKeywordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayKeywordDto&&(identical(other.searchDate, searchDate) || other.searchDate == searchDate)&&const DeepCollectionEquality().equals(other.keywords, keywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchDate,const DeepCollectionEquality().hash(keywords));

@override
String toString() {
  return 'TodayKeywordDto(searchDate: $searchDate, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class $TodayKeywordDtoCopyWith<$Res>  {
  factory $TodayKeywordDtoCopyWith(TodayKeywordDto value, $Res Function(TodayKeywordDto) _then) = _$TodayKeywordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'search_date') String searchDate,@JsonKey(name: 'keywords') List<KeywordEntryDto> keywords
});




}
/// @nodoc
class _$TodayKeywordDtoCopyWithImpl<$Res>
    implements $TodayKeywordDtoCopyWith<$Res> {
  _$TodayKeywordDtoCopyWithImpl(this._self, this._then);

  final TodayKeywordDto _self;
  final $Res Function(TodayKeywordDto) _then;

/// Create a copy of TodayKeywordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchDate = null,Object? keywords = null,}) {
  return _then(_self.copyWith(
searchDate: null == searchDate ? _self.searchDate : searchDate // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<KeywordEntryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayKeywordDto].
extension TodayKeywordDtoPatterns on TodayKeywordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayKeywordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayKeywordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayKeywordDto value)  $default,){
final _that = this;
switch (_that) {
case _TodayKeywordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayKeywordDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodayKeywordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'search_date')  String searchDate, @JsonKey(name: 'keywords')  List<KeywordEntryDto> keywords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayKeywordDto() when $default != null:
return $default(_that.searchDate,_that.keywords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'search_date')  String searchDate, @JsonKey(name: 'keywords')  List<KeywordEntryDto> keywords)  $default,) {final _that = this;
switch (_that) {
case _TodayKeywordDto():
return $default(_that.searchDate,_that.keywords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'search_date')  String searchDate, @JsonKey(name: 'keywords')  List<KeywordEntryDto> keywords)?  $default,) {final _that = this;
switch (_that) {
case _TodayKeywordDto() when $default != null:
return $default(_that.searchDate,_that.keywords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayKeywordDto implements TodayKeywordDto {
  const _TodayKeywordDto({@JsonKey(name: 'search_date') required this.searchDate, @JsonKey(name: 'keywords') required final  List<KeywordEntryDto> keywords}): _keywords = keywords;
  factory _TodayKeywordDto.fromJson(Map<String, dynamic> json) => _$TodayKeywordDtoFromJson(json);

@override@JsonKey(name: 'search_date') final  String searchDate;
 final  List<KeywordEntryDto> _keywords;
@override@JsonKey(name: 'keywords') List<KeywordEntryDto> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}


/// Create a copy of TodayKeywordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayKeywordDtoCopyWith<_TodayKeywordDto> get copyWith => __$TodayKeywordDtoCopyWithImpl<_TodayKeywordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayKeywordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayKeywordDto&&(identical(other.searchDate, searchDate) || other.searchDate == searchDate)&&const DeepCollectionEquality().equals(other._keywords, _keywords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchDate,const DeepCollectionEquality().hash(_keywords));

@override
String toString() {
  return 'TodayKeywordDto(searchDate: $searchDate, keywords: $keywords)';
}


}

/// @nodoc
abstract mixin class _$TodayKeywordDtoCopyWith<$Res> implements $TodayKeywordDtoCopyWith<$Res> {
  factory _$TodayKeywordDtoCopyWith(_TodayKeywordDto value, $Res Function(_TodayKeywordDto) _then) = __$TodayKeywordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'search_date') String searchDate,@JsonKey(name: 'keywords') List<KeywordEntryDto> keywords
});




}
/// @nodoc
class __$TodayKeywordDtoCopyWithImpl<$Res>
    implements _$TodayKeywordDtoCopyWith<$Res> {
  __$TodayKeywordDtoCopyWithImpl(this._self, this._then);

  final _TodayKeywordDto _self;
  final $Res Function(_TodayKeywordDto) _then;

/// Create a copy of TodayKeywordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchDate = null,Object? keywords = null,}) {
  return _then(_TodayKeywordDto(
searchDate: null == searchDate ? _self.searchDate : searchDate // ignore: cast_nullable_to_non_nullable
as String,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<KeywordEntryDto>,
  ));
}


}

// dart format on
