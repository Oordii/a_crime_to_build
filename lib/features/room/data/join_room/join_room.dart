import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/data/active_rooms/active_rooms.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'join_room.g.dart';

@Riverpod()
class JoinRoom extends _$JoinRoom {
  @override
  Future<String?> build() async {
    return null;
  }

  FutureOr<void> joinRoom({required String code}) async {
    state = AsyncLoading();
    Map<String, dynamic> res;
    try {
      res = await supabase.rpc<Map<String, dynamic>>(
        'join_room',
        params: {'p_code': code},
      );
      ref.invalidate(activeRoomsProvider);
    } on PostgrestException catch (e) {
      throw e.message;
    }
    state = AsyncData(res['id']);
  }

  void joinActiveRoom({required Room room}) {
    state = AsyncData(room.id);
  }
}
