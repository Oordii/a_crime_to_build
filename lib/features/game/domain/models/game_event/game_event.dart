// ignore_for_file: invalid_annotation_target

import 'package:crime_game/features/game/domain/enums/event_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.freezed.dart';
part 'game_event.g.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  const factory GameEvent({
    required String id,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'event_type') required EventType eventType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'event_data') required Map<String, dynamic> eventData,
  }) = _GameEvent;

  factory GameEvent.fromJson(Map<String, dynamic> json) =>
      _$GameEventFromJson(json);
}

@freezed
abstract class NewGameEvent with _$NewGameEvent {
  const factory NewGameEvent({
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'event_type') required EventType eventType,
    @JsonKey(name: 'event_data') required Map<String, dynamic> eventData,
  }) = _NewGameEvent;

  factory NewGameEvent.fromJson(Map<String, dynamic> json) =>
      _$NewGameEventFromJson(json);
}
