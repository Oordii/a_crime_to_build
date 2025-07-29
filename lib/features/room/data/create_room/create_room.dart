import 'package:crime_game/core/resources/utils/supabase.dart';
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
    try {
      res = await supabase.from('room').insert({}).select();
    } on PostgrestException catch (e) {
      throw e.message;
    }
    state = AsyncData(res.first['id']);
  }
}
