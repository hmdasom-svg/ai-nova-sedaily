// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyword_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeywordEntryDto {

@JsonKey(name: 'keyword_name') String get keywordName;@JsonKey(name: 'mention_count') int get mentionCount;@JsonKey(name: 'named_entity_type') NamedEntityType get namedEntityType;
/// Create a copy of KeywordEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeywordEntryDtoCopyWith<KeywordEntryDto> get copyWith => _$KeywordEntryDtoCopyWithImpl<KeywordEntryDto>(this as KeywordEntryDto, _$identity);

  /// Serializes this KeywordEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeywordEntryDto&&(identical(other.keywordName, keywordName) || other.keywordName == keywordName)&&(identical(other.mentionCount, mentionCount) || other.mentionCount == mentionCount)&&(identical(other.namedEntityType, namedEntityType) || other.namedEntityType == namedEntityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keywordName,mentionCount,namedEntityType);

@override
String toString() {
  return 'KeywordEntryDto(keywordName: $keywordName, mentionCount: $mentionCount, namedEntityType: $namedEntityType)';
}


}

/// @nodoc
abstract mixin class $KeywordEntryDtoCopyWith<$Res>  {
  factory $KeywordEntryDtoCopyWith(KeywordEntryDto value, $Res Function(KeywordEntryDto) _then) = _$KeywordEntryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'keyword_name') String keywordName,@JsonKey(name: 'mention_count') int mentionCount,@JsonKey(name: 'named_entity_type') NamedEntityType namedEntityType
});




}
/// @nodoc
class _$KeywordEntryDtoCopyWithImpl<$Res>
    implements $KeywordEntryDtoCopyWith<$Res> {
  _$KeywordEntryDtoCopyWithImpl(this._self, this._then);

  final KeywordEntryDto _self;
  final $Res Function(KeywordEntryDto) _then;

/// Create a copy of KeywordEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keywordName = null,Object? mentionCount = null,Object? namedEntityType = null,}) {
  return _then(_self.copyWith(
keywordName: null == keywordName ? _self.keywordName : keywordName // ignore: cast_nullable_to_non_nullable
as String,mentionCount: null == mentionCount ? _self.mentionCount : mentionCount // ignore: cast_nullable_to_non_nullable
as int,namedEntityType: null == namedEntityType ? _self.namedEntityType : namedEntityType // ignore: cast_nullable_to_non_nullable
as NamedEntityType,
  ));
}

}


/// Adds pattern-matching-related methods to [KeywordEntryDto].
extension KeywordEntryDtoPatterns on KeywordEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeywordEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeywordEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeywordEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _KeywordEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeywordEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _KeywordEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyword_name')  String keywordName, @JsonKey(name: 'mention_count')  int mentionCount, @JsonKey(name: 'named_entity_type')  NamedEntityType namedEntityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeywordEntryDto() when $default != null:
return $default(_that.keywordName,_that.mentionCount,_that.namedEntityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyword_name')  String keywordName, @JsonKey(name: 'mention_count')  int mentionCount, @JsonKey(name: 'named_entity_type')  NamedEntityType namedEntityType)  $default,) {final _that = this;
switch (_that) {
case _KeywordEntryDto():
return $default(_that.keywordName,_that.mentionCount,_that.namedEntityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'keyword_name')  String keywordName, @JsonKey(name: 'mention_count')  int mentionCount, @JsonKey(name: 'named_entity_type')  NamedEntityType namedEntityType)?  $default,) {final _that = this;
switch (_that) {
case _KeywordEntryDto() when $default != null:
return $default(_that.keywordName,_that.mentionCount,_that.namedEntityType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeywordEntryDto implements KeywordEntryDto {
  const _KeywordEntryDto({@JsonKey(name: 'keyword_name') required this.keywordName, @JsonKey(name: 'mention_count') required this.mentionCount, @JsonKey(name: 'named_entity_type') required this.namedEntityType});
  factory _KeywordEntryDto.fromJson(Map<String, dynamic> json) => _$KeywordEntryDtoFromJson(json);

@override@JsonKey(name: 'keyword_name') final  String keywordName;
@override@JsonKey(name: 'mention_count') final  int mentionCount;
@override@JsonKey(name: 'named_entity_type') final  NamedEntityType namedEntityType;

/// Create a copy of KeywordEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeywordEntryDtoCopyWith<_KeywordEntryDto> get copyWith => __$KeywordEntryDtoCopyWithImpl<_KeywordEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeywordEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeywordEntryDto&&(identical(other.keywordName, keywordName) || other.keywordName == keywordName)&&(identical(other.mentionCount, mentionCount) || other.mentionCount == mentionCount)&&(identical(other.namedEntityType, namedEntityType) || other.namedEntityType == namedEntityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keywordName,mentionCount,namedEntityType);

@override
String toString() {
  return 'KeywordEntryDto(keywordName: $keywordName, mentionCount: $mentionCount, namedEntityType: $namedEntityType)';
}


}

/// @nodoc
abstract mixin class _$KeywordEntryDtoCopyWith<$Res> implements $KeywordEntryDtoCopyWith<$Res> {
  factory _$KeywordEntryDtoCopyWith(_KeywordEntryDto value, $Res Function(_KeywordEntryDto) _then) = __$KeywordEntryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'keyword_name') String keywordName,@JsonKey(name: 'mention_count') int mentionCount,@JsonKey(name: 'named_entity_type') NamedEntityType namedEntityType
});




}
/// @nodoc
class __$KeywordEntryDtoCopyWithImpl<$Res>
    implements _$KeywordEntryDtoCopyWith<$Res> {
  __$KeywordEntryDtoCopyWithImpl(this._self, this._then);

  final _KeywordEntryDto _self;
  final $Res Function(_KeywordEntryDto) _then;

/// Create a copy of KeywordEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keywordName = null,Object? mentionCount = null,Object? namedEntityType = null,}) {
  return _then(_KeywordEntryDto(
keywordName: null == keywordName ? _self.keywordName : keywordName // ignore: cast_nullable_to_non_nullable
as String,mentionCount: null == mentionCount ? _self.mentionCount : mentionCount // ignore: cast_nullable_to_non_nullable
as int,namedEntityType: null == namedEntityType ? _self.namedEntityType : namedEntityType // ignore: cast_nullable_to_non_nullable
as NamedEntityType,
  ));
}


}

// dart format on
