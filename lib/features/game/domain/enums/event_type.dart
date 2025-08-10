import 'package:json_annotation/json_annotation.dart';

enum EventType {
  @JsonValue('game_start')
  gameStart,

  @JsonValue('move')
  move,

  @JsonValue('object_interaction')
  objectInteraction,

  @JsonValue('dialog_choice')
  dialogChoice,

  @JsonValue('minigame_result')
  minigameResult,
}

extension EventTypeJson on EventType {
  String get json {
    switch (this) {
      case EventType.gameStart:
        return 'game_start';
      case EventType.move:
        return 'move';
      case EventType.objectInteraction:
        return 'object_interaction';
      case EventType.dialogChoice:
        return 'dialog_choice';
      case EventType.minigameResult:
        return 'minigame_result';
    }
  }
}
