import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/game/domain/enums/event_type.dart';
import 'package:crime_game/features/game/domain/models/game_event/game_event.dart';
import 'package:crime_game/features/room/data/room/room_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_game.g.dart';

@riverpod
Future<void> startGame(Ref ref) async {
  final room = ref.read(roomDataProvider);

  if (!room.hasValue) {
    throw 'no_room_entered';
  }

  if (room.value!.creator.id != supabase.auth.currentUser?.id) {
    throw 'unauthorized';
  }

  final res = await supabase
      .from('game_event')
      .select()
      .eq('room_id', room.value!.id)
      .eq('event_type', EventType.gameStart.json);

  if (res.isNotEmpty) {
    throw 'game_already_started';
  }

  await supabase
      .from('game_event')
      .insert(
        NewGameEvent(
          roomId: room.value!.id,
          eventType: EventType.gameStart,
          eventData: {},
        ).toJson(),
      );
}
