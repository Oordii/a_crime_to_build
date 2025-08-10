// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameEvent _$GameEventFromJson(Map<String, dynamic> json) => _GameEvent(
  id: json['id'] as String,
  roomId: json['room_id'] as String,
  eventType: $enumDecode(_$EventTypeEnumMap, json['event_type']),
  createdAt: DateTime.parse(json['created_at'] as String),
  eventData: json['event_data'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GameEventToJson(_GameEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'event_type': _$EventTypeEnumMap[instance.eventType]!,
      'created_at': instance.createdAt.toIso8601String(),
      'event_data': instance.eventData,
    };

const _$EventTypeEnumMap = {
  EventType.gameStart: 'game_start',
  EventType.move: 'move',
  EventType.objectInteraction: 'object_interaction',
  EventType.dialogChoice: 'dialog_choice',
  EventType.minigameResult: 'minigame_result',
};

_NewGameEvent _$NewGameEventFromJson(Map<String, dynamic> json) =>
    _NewGameEvent(
      roomId: json['room_id'] as String,
      eventType: $enumDecode(_$EventTypeEnumMap, json['event_type']),
      eventData: json['event_data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$NewGameEventToJson(_NewGameEvent instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'event_type': _$EventTypeEnumMap[instance.eventType]!,
      'event_data': instance.eventData,
    };
