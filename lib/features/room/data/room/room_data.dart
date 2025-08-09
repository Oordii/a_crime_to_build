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

  // represents leaving room for state management and navigation, not leaving room logic as it is separated in leavingRoom provider
  Future<void> leaveRoom() async {
    await _channel?.unsubscribe();
    _channel = null;
    ref.invalidate(joinRoomProvider);
    ref.invalidate(createRoomProvider);
    state = const AsyncValue.loading();
    state = AsyncValue.error('no_room_entered', StackTrace.current);
    ref.invalidateSelf();
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
        callback: (payload) async {
          if (payload.oldRecord['user_id'] == supabase.auth.currentUser?.id) {
            final room = await _fetchRoom(payload.oldRecord['room_id']);
            if (room.creator.id != supabase.auth.currentUser?.id) {
              await leaveRoom();
            }
          } else {
            await update((current) async {
              final room = await _fetchRoom(current.id);
              return room;
            });
          }
        },
      )
      ..onPostgresChanges(
        table: 'room',
        event: PostgresChangeEvent.update,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'id',
          value: roomId,
        ),
        callback: (payload) async {
          final oldCreatorId = state.value?.creator.id;

          if (oldCreatorId == supabase.auth.currentUser?.id &&
              payload.newRecord['creator_id'] !=
                  supabase.auth.currentUser?.id) {
            await leaveRoom();
          } else {
            update((current) async {
              final room = await _fetchRoom(current.id);
              return room;
            });
          }
        },
      )
      ..onPostgresChanges(
        table: 'room',
        event: PostgresChangeEvent.delete,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'id',
          value: roomId,
        ),
        callback: (payload) async {
          await leaveRoom();
        },
      )
      ..subscribe();

    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }
}
