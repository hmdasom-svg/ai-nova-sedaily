// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_map_graph_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IssueMapGraphDto {

 List<IssueMapNodeDto> get nodes; List<IssueMapLinkDto> get links; List<IssueMapCategoryDto> get categories;
/// Create a copy of IssueMapGraphDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapGraphDtoCopyWith<IssueMapGraphDto> get copyWith => _$IssueMapGraphDtoCopyWithImpl<IssueMapGraphDto>(this as IssueMapGraphDto, _$identity);

  /// Serializes this IssueMapGraphDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapGraphDto&&const DeepCollectionEquality().equals(other.nodes, nodes)&&const DeepCollectionEquality().equals(other.links, links)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nodes),const DeepCollectionEquality().hash(links),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'IssueMapGraphDto(nodes: $nodes, links: $links, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $IssueMapGraphDtoCopyWith<$Res>  {
  factory $IssueMapGraphDtoCopyWith(IssueMapGraphDto value, $Res Function(IssueMapGraphDto) _then) = _$IssueMapGraphDtoCopyWithImpl;
@useResult
$Res call({
 List<IssueMapNodeDto> nodes, List<IssueMapLinkDto> links, List<IssueMapCategoryDto> categories
});




}
/// @nodoc
class _$IssueMapGraphDtoCopyWithImpl<$Res>
    implements $IssueMapGraphDtoCopyWith<$Res> {
  _$IssueMapGraphDtoCopyWithImpl(this._self, this._then);

  final IssueMapGraphDto _self;
  final $Res Function(IssueMapGraphDto) _then;

/// Create a copy of IssueMapGraphDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodes = null,Object? links = null,Object? categories = null,}) {
  return _then(_self.copyWith(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<IssueMapNodeDto>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<IssueMapLinkDto>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<IssueMapCategoryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMapGraphDto].
extension IssueMapGraphDtoPatterns on IssueMapGraphDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapGraphDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapGraphDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapGraphDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapGraphDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapGraphDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapGraphDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IssueMapNodeDto> nodes,  List<IssueMapLinkDto> links,  List<IssueMapCategoryDto> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapGraphDto() when $default != null:
return $default(_that.nodes,_that.links,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IssueMapNodeDto> nodes,  List<IssueMapLinkDto> links,  List<IssueMapCategoryDto> categories)  $default,) {final _that = this;
switch (_that) {
case _IssueMapGraphDto():
return $default(_that.nodes,_that.links,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IssueMapNodeDto> nodes,  List<IssueMapLinkDto> links,  List<IssueMapCategoryDto> categories)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapGraphDto() when $default != null:
return $default(_that.nodes,_that.links,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapGraphDto implements IssueMapGraphDto {
  const _IssueMapGraphDto({required final  List<IssueMapNodeDto> nodes, required final  List<IssueMapLinkDto> links, required final  List<IssueMapCategoryDto> categories}): _nodes = nodes,_links = links,_categories = categories;
  factory _IssueMapGraphDto.fromJson(Map<String, dynamic> json) => _$IssueMapGraphDtoFromJson(json);

 final  List<IssueMapNodeDto> _nodes;
@override List<IssueMapNodeDto> get nodes {
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nodes);
}

 final  List<IssueMapLinkDto> _links;
@override List<IssueMapLinkDto> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

 final  List<IssueMapCategoryDto> _categories;
@override List<IssueMapCategoryDto> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of IssueMapGraphDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapGraphDtoCopyWith<_IssueMapGraphDto> get copyWith => __$IssueMapGraphDtoCopyWithImpl<_IssueMapGraphDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapGraphDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapGraphDto&&const DeepCollectionEquality().equals(other._nodes, _nodes)&&const DeepCollectionEquality().equals(other._links, _links)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nodes),const DeepCollectionEquality().hash(_links),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'IssueMapGraphDto(nodes: $nodes, links: $links, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$IssueMapGraphDtoCopyWith<$Res> implements $IssueMapGraphDtoCopyWith<$Res> {
  factory _$IssueMapGraphDtoCopyWith(_IssueMapGraphDto value, $Res Function(_IssueMapGraphDto) _then) = __$IssueMapGraphDtoCopyWithImpl;
@override @useResult
$Res call({
 List<IssueMapNodeDto> nodes, List<IssueMapLinkDto> links, List<IssueMapCategoryDto> categories
});




}
/// @nodoc
class __$IssueMapGraphDtoCopyWithImpl<$Res>
    implements _$IssueMapGraphDtoCopyWith<$Res> {
  __$IssueMapGraphDtoCopyWithImpl(this._self, this._then);

  final _IssueMapGraphDto _self;
  final $Res Function(_IssueMapGraphDto) _then;

/// Create a copy of IssueMapGraphDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodes = null,Object? links = null,Object? categories = null,}) {
  return _then(_IssueMapGraphDto(
nodes: null == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<IssueMapNodeDto>,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<IssueMapLinkDto>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<IssueMapCategoryDto>,
  ));
}


}


/// @nodoc
mixin _$IssueMapNodeDto {

 String get id; String get name; int get value;@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double get symbolSize;@JsonKey(name: 'category') String get categoryName;
/// Create a copy of IssueMapNodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapNodeDtoCopyWith<IssueMapNodeDto> get copyWith => _$IssueMapNodeDtoCopyWithImpl<IssueMapNodeDto>(this as IssueMapNodeDto, _$identity);

  /// Serializes this IssueMapNodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapNodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.symbolSize, symbolSize) || other.symbolSize == symbolSize)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,value,symbolSize,categoryName);

@override
String toString() {
  return 'IssueMapNodeDto(id: $id, name: $name, value: $value, symbolSize: $symbolSize, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $IssueMapNodeDtoCopyWith<$Res>  {
  factory $IssueMapNodeDtoCopyWith(IssueMapNodeDto value, $Res Function(IssueMapNodeDto) _then) = _$IssueMapNodeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, int value,@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double symbolSize,@JsonKey(name: 'category') String categoryName
});




}
/// @nodoc
class _$IssueMapNodeDtoCopyWithImpl<$Res>
    implements $IssueMapNodeDtoCopyWith<$Res> {
  _$IssueMapNodeDtoCopyWithImpl(this._self, this._then);

  final IssueMapNodeDto _self;
  final $Res Function(IssueMapNodeDto) _then;

/// Create a copy of IssueMapNodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? value = null,Object? symbolSize = null,Object? categoryName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,symbolSize: null == symbolSize ? _self.symbolSize : symbolSize // ignore: cast_nullable_to_non_nullable
as double,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMapNodeDto].
extension IssueMapNodeDtoPatterns on IssueMapNodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapNodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapNodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapNodeDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapNodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapNodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapNodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int value, @JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double symbolSize, @JsonKey(name: 'category')  String categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapNodeDto() when $default != null:
return $default(_that.id,_that.name,_that.value,_that.symbolSize,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int value, @JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double symbolSize, @JsonKey(name: 'category')  String categoryName)  $default,) {final _that = this;
switch (_that) {
case _IssueMapNodeDto():
return $default(_that.id,_that.name,_that.value,_that.symbolSize,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int value, @JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double symbolSize, @JsonKey(name: 'category')  String categoryName)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapNodeDto() when $default != null:
return $default(_that.id,_that.name,_that.value,_that.symbolSize,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapNodeDto implements IssueMapNodeDto {
  const _IssueMapNodeDto({required this.id, required this.name, required this.value, @JsonKey(fromJson: IssueMapDtoConverter.toDouble) required this.symbolSize, @JsonKey(name: 'category') required this.categoryName});
  factory _IssueMapNodeDto.fromJson(Map<String, dynamic> json) => _$IssueMapNodeDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  int value;
@override@JsonKey(fromJson: IssueMapDtoConverter.toDouble) final  double symbolSize;
@override@JsonKey(name: 'category') final  String categoryName;

/// Create a copy of IssueMapNodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapNodeDtoCopyWith<_IssueMapNodeDto> get copyWith => __$IssueMapNodeDtoCopyWithImpl<_IssueMapNodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapNodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapNodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value)&&(identical(other.symbolSize, symbolSize) || other.symbolSize == symbolSize)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,value,symbolSize,categoryName);

@override
String toString() {
  return 'IssueMapNodeDto(id: $id, name: $name, value: $value, symbolSize: $symbolSize, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$IssueMapNodeDtoCopyWith<$Res> implements $IssueMapNodeDtoCopyWith<$Res> {
  factory _$IssueMapNodeDtoCopyWith(_IssueMapNodeDto value, $Res Function(_IssueMapNodeDto) _then) = __$IssueMapNodeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int value,@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double symbolSize,@JsonKey(name: 'category') String categoryName
});




}
/// @nodoc
class __$IssueMapNodeDtoCopyWithImpl<$Res>
    implements _$IssueMapNodeDtoCopyWith<$Res> {
  __$IssueMapNodeDtoCopyWithImpl(this._self, this._then);

  final _IssueMapNodeDto _self;
  final $Res Function(_IssueMapNodeDto) _then;

/// Create a copy of IssueMapNodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? value = null,Object? symbolSize = null,Object? categoryName = null,}) {
  return _then(_IssueMapNodeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,symbolSize: null == symbolSize ? _self.symbolSize : symbolSize // ignore: cast_nullable_to_non_nullable
as double,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$IssueMapLinkDto {

 String get source; String get target;@JsonKey(name: 'lineStyle') IssueMapLinkStyleDto get lineStyle;
/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapLinkDtoCopyWith<IssueMapLinkDto> get copyWith => _$IssueMapLinkDtoCopyWithImpl<IssueMapLinkDto>(this as IssueMapLinkDto, _$identity);

  /// Serializes this IssueMapLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapLinkDto&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.lineStyle, lineStyle) || other.lineStyle == lineStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,target,lineStyle);

@override
String toString() {
  return 'IssueMapLinkDto(source: $source, target: $target, lineStyle: $lineStyle)';
}


}

/// @nodoc
abstract mixin class $IssueMapLinkDtoCopyWith<$Res>  {
  factory $IssueMapLinkDtoCopyWith(IssueMapLinkDto value, $Res Function(IssueMapLinkDto) _then) = _$IssueMapLinkDtoCopyWithImpl;
@useResult
$Res call({
 String source, String target,@JsonKey(name: 'lineStyle') IssueMapLinkStyleDto lineStyle
});


$IssueMapLinkStyleDtoCopyWith<$Res> get lineStyle;

}
/// @nodoc
class _$IssueMapLinkDtoCopyWithImpl<$Res>
    implements $IssueMapLinkDtoCopyWith<$Res> {
  _$IssueMapLinkDtoCopyWithImpl(this._self, this._then);

  final IssueMapLinkDto _self;
  final $Res Function(IssueMapLinkDto) _then;

/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? target = null,Object? lineStyle = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,lineStyle: null == lineStyle ? _self.lineStyle : lineStyle // ignore: cast_nullable_to_non_nullable
as IssueMapLinkStyleDto,
  ));
}
/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMapLinkStyleDtoCopyWith<$Res> get lineStyle {
  
  return $IssueMapLinkStyleDtoCopyWith<$Res>(_self.lineStyle, (value) {
    return _then(_self.copyWith(lineStyle: value));
  });
}
}


/// Adds pattern-matching-related methods to [IssueMapLinkDto].
extension IssueMapLinkDtoPatterns on IssueMapLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String target, @JsonKey(name: 'lineStyle')  IssueMapLinkStyleDto lineStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapLinkDto() when $default != null:
return $default(_that.source,_that.target,_that.lineStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String target, @JsonKey(name: 'lineStyle')  IssueMapLinkStyleDto lineStyle)  $default,) {final _that = this;
switch (_that) {
case _IssueMapLinkDto():
return $default(_that.source,_that.target,_that.lineStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String target, @JsonKey(name: 'lineStyle')  IssueMapLinkStyleDto lineStyle)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapLinkDto() when $default != null:
return $default(_that.source,_that.target,_that.lineStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapLinkDto implements IssueMapLinkDto {
  const _IssueMapLinkDto({required this.source, required this.target, @JsonKey(name: 'lineStyle') required this.lineStyle});
  factory _IssueMapLinkDto.fromJson(Map<String, dynamic> json) => _$IssueMapLinkDtoFromJson(json);

@override final  String source;
@override final  String target;
@override@JsonKey(name: 'lineStyle') final  IssueMapLinkStyleDto lineStyle;

/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapLinkDtoCopyWith<_IssueMapLinkDto> get copyWith => __$IssueMapLinkDtoCopyWithImpl<_IssueMapLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapLinkDto&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.lineStyle, lineStyle) || other.lineStyle == lineStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,target,lineStyle);

@override
String toString() {
  return 'IssueMapLinkDto(source: $source, target: $target, lineStyle: $lineStyle)';
}


}

/// @nodoc
abstract mixin class _$IssueMapLinkDtoCopyWith<$Res> implements $IssueMapLinkDtoCopyWith<$Res> {
  factory _$IssueMapLinkDtoCopyWith(_IssueMapLinkDto value, $Res Function(_IssueMapLinkDto) _then) = __$IssueMapLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String source, String target,@JsonKey(name: 'lineStyle') IssueMapLinkStyleDto lineStyle
});


@override $IssueMapLinkStyleDtoCopyWith<$Res> get lineStyle;

}
/// @nodoc
class __$IssueMapLinkDtoCopyWithImpl<$Res>
    implements _$IssueMapLinkDtoCopyWith<$Res> {
  __$IssueMapLinkDtoCopyWithImpl(this._self, this._then);

  final _IssueMapLinkDto _self;
  final $Res Function(_IssueMapLinkDto) _then;

/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? target = null,Object? lineStyle = null,}) {
  return _then(_IssueMapLinkDto(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,lineStyle: null == lineStyle ? _self.lineStyle : lineStyle // ignore: cast_nullable_to_non_nullable
as IssueMapLinkStyleDto,
  ));
}

/// Create a copy of IssueMapLinkDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMapLinkStyleDtoCopyWith<$Res> get lineStyle {
  
  return $IssueMapLinkStyleDtoCopyWith<$Res>(_self.lineStyle, (value) {
    return _then(_self.copyWith(lineStyle: value));
  });
}
}


/// @nodoc
mixin _$IssueMapLinkStyleDto {

@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double get width;
/// Create a copy of IssueMapLinkStyleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapLinkStyleDtoCopyWith<IssueMapLinkStyleDto> get copyWith => _$IssueMapLinkStyleDtoCopyWithImpl<IssueMapLinkStyleDto>(this as IssueMapLinkStyleDto, _$identity);

  /// Serializes this IssueMapLinkStyleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapLinkStyleDto&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width);

@override
String toString() {
  return 'IssueMapLinkStyleDto(width: $width)';
}


}

/// @nodoc
abstract mixin class $IssueMapLinkStyleDtoCopyWith<$Res>  {
  factory $IssueMapLinkStyleDtoCopyWith(IssueMapLinkStyleDto value, $Res Function(IssueMapLinkStyleDto) _then) = _$IssueMapLinkStyleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double width
});




}
/// @nodoc
class _$IssueMapLinkStyleDtoCopyWithImpl<$Res>
    implements $IssueMapLinkStyleDtoCopyWith<$Res> {
  _$IssueMapLinkStyleDtoCopyWithImpl(this._self, this._then);

  final IssueMapLinkStyleDto _self;
  final $Res Function(IssueMapLinkStyleDto) _then;

/// Create a copy of IssueMapLinkStyleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMapLinkStyleDto].
extension IssueMapLinkStyleDtoPatterns on IssueMapLinkStyleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapLinkStyleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapLinkStyleDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapLinkStyleDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto() when $default != null:
return $default(_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double width)  $default,) {final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto():
return $default(_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: IssueMapDtoConverter.toDouble)  double width)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapLinkStyleDto() when $default != null:
return $default(_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapLinkStyleDto implements IssueMapLinkStyleDto {
  const _IssueMapLinkStyleDto({@JsonKey(fromJson: IssueMapDtoConverter.toDouble) required this.width});
  factory _IssueMapLinkStyleDto.fromJson(Map<String, dynamic> json) => _$IssueMapLinkStyleDtoFromJson(json);

@override@JsonKey(fromJson: IssueMapDtoConverter.toDouble) final  double width;

/// Create a copy of IssueMapLinkStyleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapLinkStyleDtoCopyWith<_IssueMapLinkStyleDto> get copyWith => __$IssueMapLinkStyleDtoCopyWithImpl<_IssueMapLinkStyleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapLinkStyleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapLinkStyleDto&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width);

@override
String toString() {
  return 'IssueMapLinkStyleDto(width: $width)';
}


}

/// @nodoc
abstract mixin class _$IssueMapLinkStyleDtoCopyWith<$Res> implements $IssueMapLinkStyleDtoCopyWith<$Res> {
  factory _$IssueMapLinkStyleDtoCopyWith(_IssueMapLinkStyleDto value, $Res Function(_IssueMapLinkStyleDto) _then) = __$IssueMapLinkStyleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: IssueMapDtoConverter.toDouble) double width
});




}
/// @nodoc
class __$IssueMapLinkStyleDtoCopyWithImpl<$Res>
    implements _$IssueMapLinkStyleDtoCopyWith<$Res> {
  __$IssueMapLinkStyleDtoCopyWithImpl(this._self, this._then);

  final _IssueMapLinkStyleDto _self;
  final $Res Function(_IssueMapLinkStyleDto) _then;

/// Create a copy of IssueMapLinkStyleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,}) {
  return _then(_IssueMapLinkStyleDto(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$IssueMapCategoryDto {

 String get name;
/// Create a copy of IssueMapCategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMapCategoryDtoCopyWith<IssueMapCategoryDto> get copyWith => _$IssueMapCategoryDtoCopyWithImpl<IssueMapCategoryDto>(this as IssueMapCategoryDto, _$identity);

  /// Serializes this IssueMapCategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMapCategoryDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'IssueMapCategoryDto(name: $name)';
}


}

/// @nodoc
abstract mixin class $IssueMapCategoryDtoCopyWith<$Res>  {
  factory $IssueMapCategoryDtoCopyWith(IssueMapCategoryDto value, $Res Function(IssueMapCategoryDto) _then) = _$IssueMapCategoryDtoCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$IssueMapCategoryDtoCopyWithImpl<$Res>
    implements $IssueMapCategoryDtoCopyWith<$Res> {
  _$IssueMapCategoryDtoCopyWithImpl(this._self, this._then);

  final IssueMapCategoryDto _self;
  final $Res Function(IssueMapCategoryDto) _then;

/// Create a copy of IssueMapCategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMapCategoryDto].
extension IssueMapCategoryDtoPatterns on IssueMapCategoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMapCategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMapCategoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMapCategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _IssueMapCategoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMapCategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMapCategoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMapCategoryDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _IssueMapCategoryDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _IssueMapCategoryDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMapCategoryDto implements IssueMapCategoryDto {
  const _IssueMapCategoryDto({required this.name});
  factory _IssueMapCategoryDto.fromJson(Map<String, dynamic> json) => _$IssueMapCategoryDtoFromJson(json);

@override final  String name;

/// Create a copy of IssueMapCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMapCategoryDtoCopyWith<_IssueMapCategoryDto> get copyWith => __$IssueMapCategoryDtoCopyWithImpl<_IssueMapCategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMapCategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMapCategoryDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'IssueMapCategoryDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$IssueMapCategoryDtoCopyWith<$Res> implements $IssueMapCategoryDtoCopyWith<$Res> {
  factory _$IssueMapCategoryDtoCopyWith(_IssueMapCategoryDto value, $Res Function(_IssueMapCategoryDto) _then) = __$IssueMapCategoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$IssueMapCategoryDtoCopyWithImpl<$Res>
    implements _$IssueMapCategoryDtoCopyWith<$Res> {
  __$IssueMapCategoryDtoCopyWithImpl(this._self, this._then);

  final _IssueMapCategoryDto _self;
  final $Res Function(_IssueMapCategoryDto) _then;

/// Create a copy of IssueMapCategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_IssueMapCategoryDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
