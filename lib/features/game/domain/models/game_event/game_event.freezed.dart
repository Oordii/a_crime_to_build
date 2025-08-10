// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameEvent {

 String get id;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'event_type') EventType get eventType;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'event_data') Map<String, dynamic> get eventData;
/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameEventCopyWith<GameEvent> get copyWith => _$GameEventCopyWithImpl<GameEvent>(this as GameEvent, _$identity);

  /// Serializes this GameEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.eventData, eventData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,eventType,createdAt,const DeepCollectionEquality().hash(eventData));

@override
String toString() {
  return 'GameEvent(id: $id, roomId: $roomId, eventType: $eventType, createdAt: $createdAt, eventData: $eventData)';
}


}

/// @nodoc
abstract mixin class $GameEventCopyWith<$Res>  {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) _then) = _$GameEventCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'event_type') EventType eventType,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'event_data') Map<String, dynamic> eventData
});




}
/// @nodoc
class _$GameEventCopyWithImpl<$Res>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._self, this._then);

  final GameEvent _self;
  final $Res Function(GameEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomId = null,Object? eventType = null,Object? createdAt = null,Object? eventData = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,eventData: null == eventData ? _self.eventData : eventData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameEvent value)  $default,){
final _that = this;
switch (_that) {
case _GameEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameEvent value)?  $default,){
final _that = this;
switch (_that) {
case _GameEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameEvent() when $default != null:
return $default(_that.id,_that.roomId,_that.eventType,_that.createdAt,_that.eventData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)  $default,) {final _that = this;
switch (_that) {
case _GameEvent():
return $default(_that.id,_that.roomId,_that.eventType,_that.createdAt,_that.eventData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)?  $default,) {final _that = this;
switch (_that) {
case _GameEvent() when $default != null:
return $default(_that.id,_that.roomId,_that.eventType,_that.createdAt,_that.eventData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameEvent implements GameEvent {
  const _GameEvent({required this.id, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'event_type') required this.eventType, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'event_data') required final  Map<String, dynamic> eventData}): _eventData = eventData;
  factory _GameEvent.fromJson(Map<String, dynamic> json) => _$GameEventFromJson(json);

@override final  String id;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'event_type') final  EventType eventType;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
 final  Map<String, dynamic> _eventData;
@override@JsonKey(name: 'event_data') Map<String, dynamic> get eventData {
  if (_eventData is EqualUnmodifiableMapView) return _eventData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_eventData);
}


/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameEventCopyWith<_GameEvent> get copyWith => __$GameEventCopyWithImpl<_GameEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._eventData, _eventData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,eventType,createdAt,const DeepCollectionEquality().hash(_eventData));

@override
String toString() {
  return 'GameEvent(id: $id, roomId: $roomId, eventType: $eventType, createdAt: $createdAt, eventData: $eventData)';
}


}

/// @nodoc
abstract mixin class _$GameEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$GameEventCopyWith(_GameEvent value, $Res Function(_GameEvent) _then) = __$GameEventCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'event_type') EventType eventType,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'event_data') Map<String, dynamic> eventData
});




}
/// @nodoc
class __$GameEventCopyWithImpl<$Res>
    implements _$GameEventCopyWith<$Res> {
  __$GameEventCopyWithImpl(this._self, this._then);

  final _GameEvent _self;
  final $Res Function(_GameEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomId = null,Object? eventType = null,Object? createdAt = null,Object? eventData = null,}) {
  return _then(_GameEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,eventData: null == eventData ? _self._eventData : eventData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$NewGameEvent {

@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'event_type') EventType get eventType;@JsonKey(name: 'event_data') Map<String, dynamic> get eventData;
/// Create a copy of NewGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewGameEventCopyWith<NewGameEvent> get copyWith => _$NewGameEventCopyWithImpl<NewGameEvent>(this as NewGameEvent, _$identity);

  /// Serializes this NewGameEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewGameEvent&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&const DeepCollectionEquality().equals(other.eventData, eventData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,eventType,const DeepCollectionEquality().hash(eventData));

@override
String toString() {
  return 'NewGameEvent(roomId: $roomId, eventType: $eventType, eventData: $eventData)';
}


}

/// @nodoc
abstract mixin class $NewGameEventCopyWith<$Res>  {
  factory $NewGameEventCopyWith(NewGameEvent value, $Res Function(NewGameEvent) _then) = _$NewGameEventCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'event_type') EventType eventType,@JsonKey(name: 'event_data') Map<String, dynamic> eventData
});




}
/// @nodoc
class _$NewGameEventCopyWithImpl<$Res>
    implements $NewGameEventCopyWith<$Res> {
  _$NewGameEventCopyWithImpl(this._self, this._then);

  final NewGameEvent _self;
  final $Res Function(NewGameEvent) _then;

/// Create a copy of NewGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? eventType = null,Object? eventData = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,eventData: null == eventData ? _self.eventData : eventData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewGameEvent].
extension NewGameEventPatterns on NewGameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewGameEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewGameEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewGameEvent value)  $default,){
final _that = this;
switch (_that) {
case _NewGameEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewGameEvent value)?  $default,){
final _that = this;
switch (_that) {
case _NewGameEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewGameEvent() when $default != null:
return $default(_that.roomId,_that.eventType,_that.eventData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)  $default,) {final _that = this;
switch (_that) {
case _NewGameEvent():
return $default(_that.roomId,_that.eventType,_that.eventData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'event_type')  EventType eventType, @JsonKey(name: 'event_data')  Map<String, dynamic> eventData)?  $default,) {final _that = this;
switch (_that) {
case _NewGameEvent() when $default != null:
return $default(_that.roomId,_that.eventType,_that.eventData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewGameEvent implements NewGameEvent {
  const _NewGameEvent({@JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'event_type') required this.eventType, @JsonKey(name: 'event_data') required final  Map<String, dynamic> eventData}): _eventData = eventData;
  factory _NewGameEvent.fromJson(Map<String, dynamic> json) => _$NewGameEventFromJson(json);

@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'event_type') final  EventType eventType;
 final  Map<String, dynamic> _eventData;
@override@JsonKey(name: 'event_data') Map<String, dynamic> get eventData {
  if (_eventData is EqualUnmodifiableMapView) return _eventData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_eventData);
}


/// Create a copy of NewGameEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewGameEventCopyWith<_NewGameEvent> get copyWith => __$NewGameEventCopyWithImpl<_NewGameEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewGameEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewGameEvent&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.eventType, eventType) || other.eventType == eventType)&&const DeepCollectionEquality().equals(other._eventData, _eventData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,eventType,const DeepCollectionEquality().hash(_eventData));

@override
String toString() {
  return 'NewGameEvent(roomId: $roomId, eventType: $eventType, eventData: $eventData)';
}


}

/// @nodoc
abstract mixin class _$NewGameEventCopyWith<$Res> implements $NewGameEventCopyWith<$Res> {
  factory _$NewGameEventCopyWith(_NewGameEvent value, $Res Function(_NewGameEvent) _then) = __$NewGameEventCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'event_type') EventType eventType,@JsonKey(name: 'event_data') Map<String, dynamic> eventData
});




}
/// @nodoc
class __$NewGameEventCopyWithImpl<$Res>
    implements _$NewGameEventCopyWith<$Res> {
  __$NewGameEventCopyWithImpl(this._self, this._then);

  final _NewGameEvent _self;
  final $Res Function(_NewGameEvent) _then;

/// Create a copy of NewGameEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? eventType = null,Object? eventData = null,}) {
  return _then(_NewGameEvent(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,eventType: null == eventType ? _self.eventType : eventType // ignore: cast_nullable_to_non_nullable
as EventType,eventData: null == eventData ? _self._eventData : eventData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
