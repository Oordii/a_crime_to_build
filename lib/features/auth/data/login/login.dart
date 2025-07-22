import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login.g.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      state = const AsyncData(null);
    } on AuthException catch (e, st) {
      state = AsyncError(e.message, st);
    }
  }
}
