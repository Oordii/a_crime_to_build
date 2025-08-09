import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kick_user.g.dart';

@riverpod
Future<void> kickUser(Ref ref, {required String userId}) async {
  final room = ref.watch(roomDataProvider);

  if (room is! AsyncData<Room>) {
    return;
  }

  await supabase
      .from('room_user')
      .delete()
      .eq('user_id', userId)
      .eq('room_id', room.value.id);
}
