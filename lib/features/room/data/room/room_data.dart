import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/data/create_room/create_room.dart';
import 'package:crime_game/features/room/data/join_room/join_room.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'room_data.g.dart';

@Riverpod(keepAlive: true)
class RoomData extends _$RoomData {
  RealtimeChannel? _channel;

  @override
  Future<Room> build() async {
    final createRoom = ref.watch(createRoomProvider);
    final joinRoom = ref.watch(joinRoomProvider);
    String? roomId;

    if (createRoom.hasValue && createRoom.value != null) {
      roomId = createRoom.value!;
    } else if (joinRoom.hasValue && joinRoom.value != null) {
      roomId = joinRoom.value!;
    }
    if (roomId == null) {
      throw 'no_room_entered';
    }

    final room = await _fetchRoom(roomId);
    _subscribeToRoomUpdates(room.id);
    return room;
  }

  Future<Room> _fetchRoom(String id) async {
    final res = await supabase
        .from('room')
        .select('*, creator:creator_id(*), users:room_user(user:user_id(*))')
        .eq('id', id)
        .single();
    res['users'] = (res['users'] as List)
        .map((e) => (e as Map<String, dynamic>)['user'])
        .toList();

    return Room.fromJson(res);
  }

  void leaveRoom() {
    _channel?.unsubscribe();
    _channel = null;
    state = AsyncError('no_room_entered', StackTrace.fromString(''));
  }

  void _subscribeToRoomUpdates(String roomId) {
    _channel = supabase.channel('realtime:public:room_user')
      ..onPostgresChanges(
        table: 'room_user',
        event: PostgresChangeEvent.insert,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'room_id',
          value: roomId,
        ),
        callback: (payload) {
          update((current) async {
            final room = await _fetchRoom(current.id);
            return room;
          });
        },
      )
      ..onPostgresChanges(
        table: 'room_user',
        event: PostgresChangeEvent.delete,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'room_id',
          value: roomId,
        ),
        callback: (payload) {
          if (payload.oldRecord['user_id'] == supabase.auth.currentUser?.id) {
            leaveRoom();
          } else {
            update((current) async {
              final room = await _fetchRoom(current.id);
              return room;
            });
          }
        },
      )
      ..subscribe();

    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }
}
