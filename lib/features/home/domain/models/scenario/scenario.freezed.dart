// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScenarioModel {

 String get id; String get name;@JsonKey(name: 'short_desc') String get shortDesc;@JsonKey(name: 'full_desc') String get fullDesc;@JsonKey(name: 'cover_url') String get coverUrl;
/// Create a copy of ScenarioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScenarioModelCopyWith<ScenarioModel> get copyWith => _$ScenarioModelCopyWithImpl<ScenarioModel>(this as ScenarioModel, _$identity);

  /// Serializes this ScenarioModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScenarioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortDesc, shortDesc) || other.shortDesc == shortDesc)&&(identical(other.fullDesc, fullDesc) || other.fullDesc == fullDesc)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,shortDesc,fullDesc,coverUrl);

@override
String toString() {
  return 'ScenarioModel(id: $id, name: $name, shortDesc: $shortDesc, fullDesc: $fullDesc, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $ScenarioModelCopyWith<$Res>  {
  factory $ScenarioModelCopyWith(ScenarioModel value, $Res Function(ScenarioModel) _then) = _$ScenarioModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'short_desc') String shortDesc,@JsonKey(name: 'full_desc') String fullDesc,@JsonKey(name: 'cover_url') String coverUrl
});




}
/// @nodoc
class _$ScenarioModelCopyWithImpl<$Res>
    implements $ScenarioModelCopyWith<$Res> {
  _$ScenarioModelCopyWithImpl(this._self, this._then);

  final ScenarioModel _self;
  final $Res Function(ScenarioModel) _then;

/// Create a copy of ScenarioModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? shortDesc = null,Object? fullDesc = null,Object? coverUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortDesc: null == shortDesc ? _self.shortDesc : shortDesc // ignore: cast_nullable_to_non_nullable
as String,fullDesc: null == fullDesc ? _self.fullDesc : fullDesc // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScenarioModel].
extension ScenarioModelPatterns on ScenarioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScenarioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScenarioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScenarioModel value)  $default,){
final _that = this;
switch (_that) {
case _ScenarioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScenarioModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScenarioModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'short_desc')  String shortDesc, @JsonKey(name: 'full_desc')  String fullDesc, @JsonKey(name: 'cover_url')  String coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScenarioModel() when $default != null:
return $default(_that.id,_that.name,_that.shortDesc,_that.fullDesc,_that.coverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'short_desc')  String shortDesc, @JsonKey(name: 'full_desc')  String fullDesc, @JsonKey(name: 'cover_url')  String coverUrl)  $default,) {final _that = this;
switch (_that) {
case _ScenarioModel():
return $default(_that.id,_that.name,_that.shortDesc,_that.fullDesc,_that.coverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'short_desc')  String shortDesc, @JsonKey(name: 'full_desc')  String fullDesc, @JsonKey(name: 'cover_url')  String coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _ScenarioModel() when $default != null:
return $default(_that.id,_that.name,_that.shortDesc,_that.fullDesc,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScenarioModel implements ScenarioModel {
  const _ScenarioModel({required this.id, required this.name, @JsonKey(name: 'short_desc') required this.shortDesc, @JsonKey(name: 'full_desc') required this.fullDesc, @JsonKey(name: 'cover_url') required this.coverUrl});
  factory _ScenarioModel.fromJson(Map<String, dynamic> json) => _$ScenarioModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'short_desc') final  String shortDesc;
@override@JsonKey(name: 'full_desc') final  String fullDesc;
@override@JsonKey(name: 'cover_url') final  String coverUrl;

/// Create a copy of ScenarioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScenarioModelCopyWith<_ScenarioModel> get copyWith => __$ScenarioModelCopyWithImpl<_ScenarioModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScenarioModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScenarioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortDesc, shortDesc) || other.shortDesc == shortDesc)&&(identical(other.fullDesc, fullDesc) || other.fullDesc == fullDesc)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,shortDesc,fullDesc,coverUrl);

@override
String toString() {
  return 'ScenarioModel(id: $id, name: $name, shortDesc: $shortDesc, fullDesc: $fullDesc, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$ScenarioModelCopyWith<$Res> implements $ScenarioModelCopyWith<$Res> {
  factory _$ScenarioModelCopyWith(_ScenarioModel value, $Res Function(_ScenarioModel) _then) = __$ScenarioModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'short_desc') String shortDesc,@JsonKey(name: 'full_desc') String fullDesc,@JsonKey(name: 'cover_url') String coverUrl
});




}
/// @nodoc
class __$ScenarioModelCopyWithImpl<$Res>
    implements _$ScenarioModelCopyWith<$Res> {
  __$ScenarioModelCopyWithImpl(this._self, this._then);

  final _ScenarioModel _self;
  final $Res Function(_ScenarioModel) _then;

/// Create a copy of ScenarioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? shortDesc = null,Object? fullDesc = null,Object? coverUrl = null,}) {
  return _then(_ScenarioModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortDesc: null == shortDesc ? _self.shortDesc : shortDesc // ignore: cast_nullable_to_non_nullable
as String,fullDesc: null == fullDesc ? _self.fullDesc : fullDesc // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
