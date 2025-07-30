// ignore_for_file: invalid_annotation_target

import 'package:crime_game/features/room/domain/models/room_user/room_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  const factory Room({
    required String id,
    required String code,
    @Default([]) List<RoomUser> users,
    required RoomUser creator,
    @JsonKey(name: 'scenario_id') required String scenarioId,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
