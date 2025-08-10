import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/core/router/router.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/game/domain/domain.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'game.g.dart';

@Riverpod(keepAlive: true)
class Game extends _$Game {
  RealtimeChannel? _channel;

  @override
  Future<GameModel> build() async {
    final room = ref.watch(roomDataProvider);

    if (!room.hasValue) {
      throw 'no_room_entered';
    }

    final game = await _fetchGame(room.value!.id);
    _subscribeToGameEvents(room.value!.id);
    _processExistingEvents(game);

    return game;
  }

  Future<void> goto(String locationId) async {
    if (!state.hasValue) {
      throw 'game_not_loaded';
    }

    final room = ref.read(roomDataProvider);

    if (!room.hasValue) {
      throw 'game_not_loaded';
    }

    if (room.value!.creator.id != supabase.auth.currentUser?.id) {
      throw 'unauthorized';
    }
    final newEvent = NewGameEvent(
      roomId: room.value!.id,
      eventType: EventType.move,
      eventData: {'location_id': locationId},
    );

    await supabase.from('game_event').insert(newEvent.toJson());
  }

  Future<GameModel> _fetchGame(String id) async {
    final res = await supabase
        .from('room')
        .select(
          '*, scenario:scenario_id(*, locations:location(*)), events:game_event(*)',
        )
        .eq('id', id)
        .single();

    final modifiedJson = <String, dynamic>{
      ...res['scenario'],
      'events': res['events'],
    };

    return GameModel.fromJson(modifiedJson);
  }

  void _subscribeToGameEvents(String roomId) {
    _channel = supabase.channel('realtime:public:game_event')
      ..onPostgresChanges(
        table: 'game_event',
        event: PostgresChangeEvent.insert,
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'room_id',
          value: roomId,
        ),
        callback: (payload) {
          final newEvent = GameEvent.fromJson(payload.newRecord);
          update((current) {
            return current.copyWith(events: [...current.events, newEvent]);
          });
          _handleEvent(newEvent);
        },
      )
      ..subscribe();

    ref.onDispose(() {
      _channel?.unsubscribe();
    });
  }

  void _handleEvent(GameEvent event) async {
    if (event.eventType == EventType.move) {
      final locationId = event.eventData['location_id'];
      ref
          .read(routerProvider)
          .goNamed(
            Routes.location.name,
            pathParameters: {'location_id': locationId},
          );
    } else if (event.eventType == EventType.gameStart) {
      GameModel? game = state.value;

      if (game == null) {
        final room = ref.watch(roomDataProvider);

        if (!room.hasValue) {
          throw 'no_room_entered';
        }

        game = await _fetchGame(room.value!.id);
      }
      final location = game.locations.singleWhere((e) => e.isInitial);
      ref
          .read(routerProvider)
          .goNamed(
            Routes.location.name,
            pathParameters: {'location_id': location.id},
          );
    }
  }

  void _processExistingEvents(GameModel game) {
    final startEvent = game.events
        .where((e) => e.eventType == EventType.gameStart)
        .singleOrNull;

    if (startEvent != null) {
      final lastMoveEvent = game.events
          .where((e) => e.eventType == EventType.move)
          .lastOrNull;

      if (lastMoveEvent != null) {
        _handleEvent(lastMoveEvent);
      } else {
        _handleEvent(startEvent);
      }
    }
  }
}
