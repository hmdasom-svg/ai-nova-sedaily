// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_map_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IssueMapDto {

 IssueMapGraphDto get graph; String get summary; String get keyword;
/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapDtoCopyWith<IssueMapDto> get copyWith => _$IssueMapDtoCopyWithImpl<IssueMapDto>(this as IssueMapDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapDto&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,graph,summary,keyword);

@override
String toString() {
  return 'IssueMapDto(graph: $graph, summary: $summary, keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class $IssueMapDtoCopyWith<$Res>  {
  factory $IssueMapDtoCopyWith(IssueMapDto value, $Res Function(IssueMapDto) _then) = _$IssueMapDtoCopyWithImpl;
@useResult
$Res call({
 IssueMapGraphDto graph, String summary, String keyword
});


$IssueMapGraphDtoCopyWith<$Res> get graph;

}
/// @nodoc
class _$IssueMapDtoCopyWithImpl<$Res>
    implements $IssueMapDtoCopyWith<$Res> {
  _$IssueMapDtoCopyWithImpl(this._self, this._then);

  final IssueMapDto _self;
  final $Res Function(IssueMapDto) _then;

/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? graph = null,Object? summary = null,Object? keyword = null,}) {
  return _then(_self.copyWith(
graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as IssueMapGraphDto,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMapGraphDtoCopyWith<$Res> get graph {
  
  return $IssueMapGraphDtoCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}
}


/// Adds pattern-matching-related methods to [IssueMapDto].
extension IssueMapDtoPatterns on IssueMapDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IssueMapGraphDto graph,  String summary,  String keyword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapDto() when $default != null:
return $default(_that.graph,_that.summary,_that.keyword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IssueMapGraphDto graph,  String summary,  String keyword)  $default,) {final _that = this;
switch (_that) {
case _IssueMapDto():
return $default(_that.graph,_that.summary,_that.keyword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IssueMapGraphDto graph,  String summary,  String keyword)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapDto() when $default != null:
return $default(_that.graph,_that.summary,_that.keyword);case _:
  return null;

}
}

}

/// @nodoc


class _IssueMapDto implements IssueMapDto {
  const _IssueMapDto({required this.graph, required this.summary, required this.keyword});
  

@override final  IssueMapGraphDto graph;
@override final  String summary;
@override final  String keyword;

/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapDtoCopyWith<_IssueMapDto> get copyWith => __$IssueMapDtoCopyWithImpl<_IssueMapDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapDto&&(identical(other.graph, graph) || other.graph == graph)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.keyword, keyword) || other.keyword == keyword));
}


@override
int get hashCode => Object.hash(runtimeType,graph,summary,keyword);

@override
String toString() {
  return 'IssueMapDto(graph: $graph, summary: $summary, keyword: $keyword)';
}


}

/// @nodoc
abstract mixin class _$IssueMapDtoCopyWith<$Res> implements $IssueMapDtoCopyWith<$Res> {
  factory _$IssueMapDtoCopyWith(_IssueMapDto value, $Res Function(_IssueMapDto) _then) = __$IssueMapDtoCopyWithImpl;
@override @useResult
$Res call({
 IssueMapGraphDto graph, String summary, String keyword
});


@override $IssueMapGraphDtoCopyWith<$Res> get graph;

}
/// @nodoc
class __$IssueMapDtoCopyWithImpl<$Res>
    implements _$IssueMapDtoCopyWith<$Res> {
  __$IssueMapDtoCopyWithImpl(this._self, this._then);

  final _IssueMapDto _self;
  final $Res Function(_IssueMapDto) _then;

/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? graph = null,Object? summary = null,Object? keyword = null,}) {
  return _then(_IssueMapDto(
graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as IssueMapGraphDto,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of IssueMapDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMapGraphDtoCopyWith<$Res> get graph {
  
  return $IssueMapGraphDtoCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}
}

// dart format on
