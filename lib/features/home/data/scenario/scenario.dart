import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/home/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scenario.g.dart';

@riverpod
Future<List<ScenarioModel>> scenarios(Ref ref) async {
  final res = await supabase.from('scenario').select();
  return res.map((e) => ScenarioModel.fromJson(e)).toList();
}
