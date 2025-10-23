// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsChatDto {

 String get content;@JsonKey(fromJson: NewsChatDto._refsFromJson) List<NewsChatReferenceDto> get references;
/// Create a copy of NewsChatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsChatDtoCopyWith<NewsChatDto> get copyWith => _$NewsChatDtoCopyWithImpl<NewsChatDto>(this as NewsChatDto, _$identity);

  /// Serializes this NewsChatDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsChatDto&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.references, references));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,const DeepCollectionEquality().hash(references));

@override
String toString() {
  return 'NewsChatDto(content: $content, references: $references)';
}


}

/// @nodoc
abstract mixin class $NewsChatDtoCopyWith<$Res>  {
  factory $NewsChatDtoCopyWith(NewsChatDto value, $Res Function(NewsChatDto) _then) = _$NewsChatDtoCopyWithImpl;
@useResult
$Res call({
 String content,@JsonKey(fromJson: NewsChatDto._refsFromJson) List<NewsChatReferenceDto> references
});




}
/// @nodoc
class _$NewsChatDtoCopyWithImpl<$Res>
    implements $NewsChatDtoCopyWith<$Res> {
  _$NewsChatDtoCopyWithImpl(this._self, this._then);

  final NewsChatDto _self;
  final $Res Function(NewsChatDto) _then;

/// Create a copy of NewsChatDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? references = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<NewsChatReferenceDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsChatDto].
extension NewsChatDtoPatterns on NewsChatDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsChatDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsChatDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsChatDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsChatDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsChatDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsChatDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content, @JsonKey(fromJson: NewsChatDto._refsFromJson)  List<NewsChatReferenceDto> references)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsChatDto() when $default != null:
return $default(_that.content,_that.references);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content, @JsonKey(fromJson: NewsChatDto._refsFromJson)  List<NewsChatReferenceDto> references)  $default,) {final _that = this;
switch (_that) {
case _NewsChatDto():
return $default(_that.content,_that.references);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content, @JsonKey(fromJson: NewsChatDto._refsFromJson)  List<NewsChatReferenceDto> references)?  $default,) {final _that = this;
switch (_that) {
case _NewsChatDto() when $default != null:
return $default(_that.content,_that.references);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsChatDto implements NewsChatDto {
  const _NewsChatDto({required this.content, @JsonKey(fromJson: NewsChatDto._refsFromJson) final  List<NewsChatReferenceDto> references = const <NewsChatReferenceDto>[]}): _references = references;
  factory _NewsChatDto.fromJson(Map<String, dynamic> json) => _$NewsChatDtoFromJson(json);

@override final  String content;
 final  List<NewsChatReferenceDto> _references;
@override@JsonKey(fromJson: NewsChatDto._refsFromJson) List<NewsChatReferenceDto> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}


/// Create a copy of NewsChatDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsChatDtoCopyWith<_NewsChatDto> get copyWith => __$NewsChatDtoCopyWithImpl<_NewsChatDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsChatDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsChatDto&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._references, _references));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,const DeepCollectionEquality().hash(_references));

@override
String toString() {
  return 'NewsChatDto(content: $content, references: $references)';
}


}

/// @nodoc
abstract mixin class _$NewsChatDtoCopyWith<$Res> implements $NewsChatDtoCopyWith<$Res> {
  factory _$NewsChatDtoCopyWith(_NewsChatDto value, $Res Function(_NewsChatDto) _then) = __$NewsChatDtoCopyWithImpl;
@override @useResult
$Res call({
 String content,@JsonKey(fromJson: NewsChatDto._refsFromJson) List<NewsChatReferenceDto> references
});




}
/// @nodoc
class __$NewsChatDtoCopyWithImpl<$Res>
    implements _$NewsChatDtoCopyWith<$Res> {
  __$NewsChatDtoCopyWithImpl(this._self, this._then);

  final _NewsChatDto _self;
  final $Res Function(_NewsChatDto) _then;

/// Create a copy of NewsChatDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? references = null,}) {
  return _then(_NewsChatDto(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<NewsChatReferenceDto>,
  ));
}


}

// dart format on
