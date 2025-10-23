// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_keyword_index_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayKeywordIndexDto {

@JsonKey(name: 'keywordURL') String get keywordUrl;
/// Create a copy of TodayKeywordIndexDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayKeywordIndexDtoCopyWith<TodayKeywordIndexDto> get copyWith => _$TodayKeywordIndexDtoCopyWithImpl<TodayKeywordIndexDto>(this as TodayKeywordIndexDto, _$identity);

  /// Serializes this TodayKeywordIndexDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayKeywordIndexDto&&(identical(other.keywordUrl, keywordUrl) || other.keywordUrl == keywordUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keywordUrl);

@override
String toString() {
  return 'TodayKeywordIndexDto(keywordUrl: $keywordUrl)';
}


}

/// @nodoc
abstract mixin class $TodayKeywordIndexDtoCopyWith<$Res>  {
  factory $TodayKeywordIndexDtoCopyWith(TodayKeywordIndexDto value, $Res Function(TodayKeywordIndexDto) _then) = _$TodayKeywordIndexDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'keywordURL') String keywordUrl
});




}
/// @nodoc
class _$TodayKeywordIndexDtoCopyWithImpl<$Res>
    implements $TodayKeywordIndexDtoCopyWith<$Res> {
  _$TodayKeywordIndexDtoCopyWithImpl(this._self, this._then);

  final TodayKeywordIndexDto _self;
  final $Res Function(TodayKeywordIndexDto) _then;

/// Create a copy of TodayKeywordIndexDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keywordUrl = null,}) {
  return _then(_self.copyWith(
keywordUrl: null == keywordUrl ? _self.keywordUrl : keywordUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayKeywordIndexDto].
extension TodayKeywordIndexDtoPatterns on TodayKeywordIndexDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayKeywordIndexDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayKeywordIndexDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayKeywordIndexDto value)  $default,){
final _that = this;
switch (_that) {
case _TodayKeywordIndexDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayKeywordIndexDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodayKeywordIndexDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'keywordURL')  String keywordUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayKeywordIndexDto() when $default != null:
return $default(_that.keywordUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'keywordURL')  String keywordUrl)  $default,) {final _that = this;
switch (_that) {
case _TodayKeywordIndexDto():
return $default(_that.keywordUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'keywordURL')  String keywordUrl)?  $default,) {final _that = this;
switch (_that) {
case _TodayKeywordIndexDto() when $default != null:
return $default(_that.keywordUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayKeywordIndexDto implements TodayKeywordIndexDto {
  const _TodayKeywordIndexDto({@JsonKey(name: 'keywordURL') required this.keywordUrl});
  factory _TodayKeywordIndexDto.fromJson(Map<String, dynamic> json) => _$TodayKeywordIndexDtoFromJson(json);

@override@JsonKey(name: 'keywordURL') final  String keywordUrl;

/// Create a copy of TodayKeywordIndexDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayKeywordIndexDtoCopyWith<_TodayKeywordIndexDto> get copyWith => __$TodayKeywordIndexDtoCopyWithImpl<_TodayKeywordIndexDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayKeywordIndexDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayKeywordIndexDto&&(identical(other.keywordUrl, keywordUrl) || other.keywordUrl == keywordUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keywordUrl);

@override
String toString() {
  return 'TodayKeywordIndexDto(keywordUrl: $keywordUrl)';
}


}

/// @nodoc
abstract mixin class _$TodayKeywordIndexDtoCopyWith<$Res> implements $TodayKeywordIndexDtoCopyWith<$Res> {
  factory _$TodayKeywordIndexDtoCopyWith(_TodayKeywordIndexDto value, $Res Function(_TodayKeywordIndexDto) _then) = __$TodayKeywordIndexDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'keywordURL') String keywordUrl
});




}
/// @nodoc
class __$TodayKeywordIndexDtoCopyWithImpl<$Res>
    implements _$TodayKeywordIndexDtoCopyWith<$Res> {
  __$TodayKeywordIndexDtoCopyWithImpl(this._self, this._then);

  final _TodayKeywordIndexDto _self;
  final $Res Function(_TodayKeywordIndexDto) _then;

/// Create a copy of TodayKeywordIndexDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keywordUrl = null,}) {
  return _then(_TodayKeywordIndexDto(
keywordUrl: null == keywordUrl ? _self.keywordUrl : keywordUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
