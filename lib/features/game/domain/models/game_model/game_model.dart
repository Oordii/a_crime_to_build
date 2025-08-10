// ignore_for_file: invalid_annotation_target

import 'package:crime_game/features/game/domain/models/game_event/game_event.dart';
import 'package:crime_game/features/game/domain/models/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
abstract class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String name,
    @JsonKey(name: 'short_desc') required String shortDesc,
    @JsonKey(name: 'full_desc') required String fullDesc,
    @JsonKey(name: 'cover_url') required String coverUrl,
    @Default([]) List<Location> locations,
    @Default([]) List<GameEvent> events,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
}
