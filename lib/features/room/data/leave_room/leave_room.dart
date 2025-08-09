import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/data/room/room_data.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leave_room.g.dart';

@riverpod
class LeaveRoom extends _$LeaveRoom {
  @override
  FutureOr<bool> build() async {
    await ref.watch(roomDataProvider.future);
    return false;
  }

  Future<void> leave() async {
    final room = ref.read(roomDataProvider);

    if (room is! AsyncData<Room>) {
      return;
    }

    state = AsyncLoading();

    try {
      final userId = supabase.auth.currentUser?.id;

      if (userId == null) {
        throw 'Not authenticated';
      }

      if (userId == room.value.creator.id) {
        await supabase.rpc('leave_as_creator');
      } else {
        await supabase.from('room_user').delete().eq('user_id', userId);
      }
    } on Exception catch (e, st) {
      state = AsyncError(e, st);
    }

    state = AsyncData(true);
  }
}
