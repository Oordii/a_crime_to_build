import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/data/active_rooms/active_rooms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'create_room.g.dart';

@Riverpod()
class CreateRoom extends _$CreateRoom {
  @override
  Future<String?> build() async {
    return null;
  }

  FutureOr<void> createRoom({required String scenarioId}) async {
    state = AsyncLoading();
    List<Map<String, dynamic>> res;

    final userId = supabase.auth.currentUser?.id;

    if (userId == null) {
      state = AsyncError('Not authenticated', StackTrace.current);
      return;
    }

    try {
      await supabase.from('room').delete().eq('creator_id', userId);
      await supabase.from('room_user').delete().eq('user_id', userId);

      res = await supabase.from('room').insert({
        'scenario_id': scenarioId,
      }).select();
    } on PostgrestException catch (e) {
      throw e.message;
    }
    state = AsyncData(res.first['id']);
    ref.invalidate(activeRoomsProvider);
  }
}
