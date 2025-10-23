// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_flow_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IssueFlowResponseDto {

 String get interval;@SafeIntConverter() int get totalHists; List<IssueFlowTimeLineDto> get timeLine;
/// Create a copy of IssueFlowResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueFlowResponseDtoCopyWith<IssueFlowResponseDto> get copyWith => _$IssueFlowResponseDtoCopyWithImpl<IssueFlowResponseDto>(this as IssueFlowResponseDto, _$identity);

  /// Serializes this IssueFlowResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueFlowResponseDto&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.totalHists, totalHists) || other.totalHists == totalHists)&&const DeepCollectionEquality().equals(other.timeLine, timeLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,interval,totalHists,const DeepCollectionEquality().hash(timeLine));

@override
String toString() {
  return 'IssueFlowResponseDto(interval: $interval, totalHists: $totalHists, timeLine: $timeLine)';
}


}

/// @nodoc
abstract mixin class $IssueFlowResponseDtoCopyWith<$Res>  {
  factory $IssueFlowResponseDtoCopyWith(IssueFlowResponseDto value, $Res Function(IssueFlowResponseDto) _then) = _$IssueFlowResponseDtoCopyWithImpl;
@useResult
$Res call({
 String interval,@SafeIntConverter() int totalHists, List<IssueFlowTimeLineDto> timeLine
});




}
/// @nodoc
class _$IssueFlowResponseDtoCopyWithImpl<$Res>
    implements $IssueFlowResponseDtoCopyWith<$Res> {
  _$IssueFlowResponseDtoCopyWithImpl(this._self, this._then);

  final IssueFlowResponseDto _self;
  final $Res Function(IssueFlowResponseDto) _then;

/// Create a copy of IssueFlowResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interval = null,Object? totalHists = null,Object? timeLine = null,}) {
  return _then(_self.copyWith(
interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,totalHists: null == totalHists ? _self.totalHists : totalHists // ignore: cast_nullable_to_non_nullable
as int,timeLine: null == timeLine ? _self.timeLine : timeLine // ignore: cast_nullable_to_non_nullable
as List<IssueFlowTimeLineDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueFlowResponseDto].
extension IssueFlowResponseDtoPatterns on IssueFlowResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueFlowResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueFlowResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueFlowResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueFlowResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueFlowResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueFlowResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String interval, @SafeIntConverter()  int totalHists,  List<IssueFlowTimeLineDto> timeLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueFlowResponseDto() when $default != null:
return $default(_that.interval,_that.totalHists,_that.timeLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String interval, @SafeIntConverter()  int totalHists,  List<IssueFlowTimeLineDto> timeLine)  $default,) {final _that = this;
switch (_that) {
case _IssueFlowResponseDto():
return $default(_that.interval,_that.totalHists,_that.timeLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String interval, @SafeIntConverter()  int totalHists,  List<IssueFlowTimeLineDto> timeLine)?  $default,) {final _that = this;
switch (_that) {
case _IssueFlowResponseDto() when $default != null:
return $default(_that.interval,_that.totalHists,_that.timeLine);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _IssueFlowResponseDto implements IssueFlowResponseDto {
  const _IssueFlowResponseDto({required this.interval, @SafeIntConverter() required this.totalHists, final  List<IssueFlowTimeLineDto> timeLine = const <IssueFlowTimeLineDto>[]}): _timeLine = timeLine;
  factory _IssueFlowResponseDto.fromJson(Map<String, dynamic> json) => _$IssueFlowResponseDtoFromJson(json);

@override final  String interval;
@override@SafeIntConverter() final  int totalHists;
 final  List<IssueFlowTimeLineDto> _timeLine;
@override@JsonKey() List<IssueFlowTimeLineDto> get timeLine {
  if (_timeLine is EqualUnmodifiableListView) return _timeLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeLine);
}


/// Create a copy of IssueFlowResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueFlowResponseDtoCopyWith<_IssueFlowResponseDto> get copyWith => __$IssueFlowResponseDtoCopyWithImpl<_IssueFlowResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueFlowResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueFlowResponseDto&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.totalHists, totalHists) || other.totalHists == totalHists)&&const DeepCollectionEquality().equals(other._timeLine, _timeLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,interval,totalHists,const DeepCollectionEquality().hash(_timeLine));

@override
String toString() {
  return 'IssueFlowResponseDto(interval: $interval, totalHists: $totalHists, timeLine: $timeLine)';
}


}

/// @nodoc
abstract mixin class _$IssueFlowResponseDtoCopyWith<$Res> implements $IssueFlowResponseDtoCopyWith<$Res> {
  factory _$IssueFlowResponseDtoCopyWith(_IssueFlowResponseDto value, $Res Function(_IssueFlowResponseDto) _then) = __$IssueFlowResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String interval,@SafeIntConverter() int totalHists, List<IssueFlowTimeLineDto> timeLine
});




}
/// @nodoc
class __$IssueFlowResponseDtoCopyWithImpl<$Res>
    implements _$IssueFlowResponseDtoCopyWith<$Res> {
  __$IssueFlowResponseDtoCopyWithImpl(this._self, this._then);

  final _IssueFlowResponseDto _self;
  final $Res Function(_IssueFlowResponseDto) _then;

/// Create a copy of IssueFlowResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interval = null,Object? totalHists = null,Object? timeLine = null,}) {
  return _then(_IssueFlowResponseDto(
interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,totalHists: null == totalHists ? _self.totalHists : totalHists // ignore: cast_nullable_to_non_nullable
as int,timeLine: null == timeLine ? _self._timeLine : timeLine // ignore: cast_nullable_to_non_nullable
as List<IssueFlowTimeLineDto>,
  ));
}


}


/// @nodoc
mixin _$IssueFlowTimeLineDto {

@LabelConverter() String get label;@SafeIntConverter() int get hits;
/// Create a copy of IssueFlowTimeLineDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueFlowTimeLineDtoCopyWith<IssueFlowTimeLineDto> get copyWith => _$IssueFlowTimeLineDtoCopyWithImpl<IssueFlowTimeLineDto>(this as IssueFlowTimeLineDto, _$identity);

  /// Serializes this IssueFlowTimeLineDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueFlowTimeLineDto&&(identical(other.label, label) || other.label == label)&&(identical(other.hits, hits) || other.hits == hits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,hits);

@override
String toString() {
  return 'IssueFlowTimeLineDto(label: $label, hits: $hits)';
}


}

/// @nodoc
abstract mixin class $IssueFlowTimeLineDtoCopyWith<$Res>  {
  factory $IssueFlowTimeLineDtoCopyWith(IssueFlowTimeLineDto value, $Res Function(IssueFlowTimeLineDto) _then) = _$IssueFlowTimeLineDtoCopyWithImpl;
@useResult
$Res call({
@LabelConverter() String label,@SafeIntConverter() int hits
});




}
/// @nodoc
class _$IssueFlowTimeLineDtoCopyWithImpl<$Res>
    implements $IssueFlowTimeLineDtoCopyWith<$Res> {
  _$IssueFlowTimeLineDtoCopyWithImpl(this._self, this._then);

  final IssueFlowTimeLineDto _self;
  final $Res Function(IssueFlowTimeLineDto) _then;

/// Create a copy of IssueFlowTimeLineDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? hits = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueFlowTimeLineDto].
extension IssueFlowTimeLineDtoPatterns on IssueFlowTimeLineDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueFlowTimeLineDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueFlowTimeLineDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueFlowTimeLineDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@LabelConverter()  String label, @SafeIntConverter()  int hits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto() when $default != null:
return $default(_that.label,_that.hits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@LabelConverter()  String label, @SafeIntConverter()  int hits)  $default,) {final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto():
return $default(_that.label,_that.hits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@LabelConverter()  String label, @SafeIntConverter()  int hits)?  $default,) {final _that = this;
switch (_that) {
case _IssueFlowTimeLineDto() when $default != null:
return $default(_that.label,_that.hits);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _IssueFlowTimeLineDto implements IssueFlowTimeLineDto {
  const _IssueFlowTimeLineDto({@LabelConverter() required this.label, @SafeIntConverter() required this.hits});
  factory _IssueFlowTimeLineDto.fromJson(Map<String, dynamic> json) => _$IssueFlowTimeLineDtoFromJson(json);

@override@LabelConverter() final  String label;
@override@SafeIntConverter() final  int hits;

/// Create a copy of IssueFlowTimeLineDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueFlowTimeLineDtoCopyWith<_IssueFlowTimeLineDto> get copyWith => __$IssueFlowTimeLineDtoCopyWithImpl<_IssueFlowTimeLineDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueFlowTimeLineDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueFlowTimeLineDto&&(identical(other.label, label) || other.label == label)&&(identical(other.hits, hits) || other.hits == hits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,hits);

@override
String toString() {
  return 'IssueFlowTimeLineDto(label: $label, hits: $hits)';
}


}

/// @nodoc
abstract mixin class _$IssueFlowTimeLineDtoCopyWith<$Res> implements $IssueFlowTimeLineDtoCopyWith<$Res> {
  factory _$IssueFlowTimeLineDtoCopyWith(_IssueFlowTimeLineDto value, $Res Function(_IssueFlowTimeLineDto) _then) = __$IssueFlowTimeLineDtoCopyWithImpl;
@override @useResult
$Res call({
@LabelConverter() String label,@SafeIntConverter() int hits
});




}
/// @nodoc
class __$IssueFlowTimeLineDtoCopyWithImpl<$Res>
    implements _$IssueFlowTimeLineDtoCopyWith<$Res> {
  __$IssueFlowTimeLineDtoCopyWithImpl(this._self, this._then);

  final _IssueFlowTimeLineDto _self;
  final $Res Function(_IssueFlowTimeLineDto) _then;

/// Create a copy of IssueFlowTimeLineDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? hits = null,}) {
  return _then(_IssueFlowTimeLineDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
