// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_map_index_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IssueMapIndexDto {

@JsonKey(name: 'mapURL') String get mapUrl;@JsonKey(name: 'summaryURL') String get summaryUrl;
/// Create a copy of IssueMapIndexDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapIndexDtoCopyWith<IssueMapIndexDto> get copyWith => _$IssueMapIndexDtoCopyWithImpl<IssueMapIndexDto>(this as IssueMapIndexDto, _$identity);

  /// Serializes this IssueMapIndexDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapIndexDto&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl)&&(identical(other.summaryUrl, summaryUrl) || other.summaryUrl == summaryUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mapUrl,summaryUrl);

@override
String toString() {
  return 'IssueMapIndexDto(mapUrl: $mapUrl, summaryUrl: $summaryUrl)';
}


}

/// @nodoc
abstract mixin class $IssueMapIndexDtoCopyWith<$Res>  {
  factory $IssueMapIndexDtoCopyWith(IssueMapIndexDto value, $Res Function(IssueMapIndexDto) _then) = _$IssueMapIndexDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'mapURL') String mapUrl,@JsonKey(name: 'summaryURL') String summaryUrl
});




}
/// @nodoc
class _$IssueMapIndexDtoCopyWithImpl<$Res>
    implements $IssueMapIndexDtoCopyWith<$Res> {
  _$IssueMapIndexDtoCopyWithImpl(this._self, this._then);

  final IssueMapIndexDto _self;
  final $Res Function(IssueMapIndexDto) _then;

/// Create a copy of IssueMapIndexDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mapUrl = null,Object? summaryUrl = null,}) {
  return _then(_self.copyWith(
mapUrl: null == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String,summaryUrl: null == summaryUrl ? _self.summaryUrl : summaryUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMapIndexDto].
extension IssueMapIndexDtoPatterns on IssueMapIndexDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapIndexDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapIndexDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapIndexDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapIndexDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapIndexDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapIndexDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'mapURL')  String mapUrl, @JsonKey(name: 'summaryURL')  String summaryUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapIndexDto() when $default != null:
return $default(_that.mapUrl,_that.summaryUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'mapURL')  String mapUrl, @JsonKey(name: 'summaryURL')  String summaryUrl)  $default,) {final _that = this;
switch (_that) {
case _IssueMapIndexDto():
return $default(_that.mapUrl,_that.summaryUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'mapURL')  String mapUrl, @JsonKey(name: 'summaryURL')  String summaryUrl)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapIndexDto() when $default != null:
return $default(_that.mapUrl,_that.summaryUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapIndexDto implements IssueMapIndexDto {
  const _IssueMapIndexDto({@JsonKey(name: 'mapURL') required this.mapUrl, @JsonKey(name: 'summaryURL') required this.summaryUrl});
  factory _IssueMapIndexDto.fromJson(Map<String, dynamic> json) => _$IssueMapIndexDtoFromJson(json);

@override@JsonKey(name: 'mapURL') final  String mapUrl;
@override@JsonKey(name: 'summaryURL') final  String summaryUrl;

/// Create a copy of IssueMapIndexDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapIndexDtoCopyWith<_IssueMapIndexDto> get copyWith => __$IssueMapIndexDtoCopyWithImpl<_IssueMapIndexDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapIndexDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapIndexDto&&(identical(other.mapUrl, mapUrl) || other.mapUrl == mapUrl)&&(identical(other.summaryUrl, summaryUrl) || other.summaryUrl == summaryUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mapUrl,summaryUrl);

@override
String toString() {
  return 'IssueMapIndexDto(mapUrl: $mapUrl, summaryUrl: $summaryUrl)';
}


}

/// @nodoc
abstract mixin class _$IssueMapIndexDtoCopyWith<$Res> implements $IssueMapIndexDtoCopyWith<$Res> {
  factory _$IssueMapIndexDtoCopyWith(_IssueMapIndexDto value, $Res Function(_IssueMapIndexDto) _then) = __$IssueMapIndexDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'mapURL') String mapUrl,@JsonKey(name: 'summaryURL') String summaryUrl
});




}
/// @nodoc
class __$IssueMapIndexDtoCopyWithImpl<$Res>
    implements _$IssueMapIndexDtoCopyWith<$Res> {
  __$IssueMapIndexDtoCopyWithImpl(this._self, this._then);

  final _IssueMapIndexDto _self;
  final $Res Function(_IssueMapIndexDto) _then;

/// Create a copy of IssueMapIndexDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mapUrl = null,Object? summaryUrl = null,}) {
  return _then(_IssueMapIndexDto(
mapUrl: null == mapUrl ? _self.mapUrl : mapUrl // ignore: cast_nullable_to_non_nullable
as String,summaryUrl: null == summaryUrl ? _self.summaryUrl : summaryUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
