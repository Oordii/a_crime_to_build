import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_rooms.g.dart';

@Riverpod()
Future<List<Room>> activeRooms(Ref ref) async {
  final roomUserResponse = await supabase
      .from('room_user')
      .select(
        'room:room_id(*, creator:creator_id(*), users:room_user(user:user_id(*)))',
      )
      .eq('user_id', supabase.auth.currentUser!.id);
  roomUserResponse.map((r) {
    r = r['room'];
    r['users'] = (r['users'] as List)
        .map((e) => (e as Map<String, dynamic>)['user'])
        .toList();
    return r;
  });

  final creatorResponse = await supabase
      .from('room')
      .select('*, creator:creator_id(*), users:room_user(user:user_id(*))')
      .eq('creator_id', supabase.auth.currentUser!.id);

  creatorResponse.map((r) {
    r['users'] = (r['users'] as List)
        .map((e) => (e as Map<String, dynamic>)['user'])
        .toList();
    return r;
  });

  final mergedRooms = [...roomUserResponse, ...creatorResponse];

  return mergedRooms.map((e) => Room.fromJson(e)).toList();
}
