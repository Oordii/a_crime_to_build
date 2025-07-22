import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> signUp({required String email, required String password}) async {
    state = AsyncLoading();
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'http:localhost:50594/sign_in',
      );
      state = AsyncData(email);
    } on AuthException catch (e, st) {
      state = AsyncError(e.message, st);
    }
  }
}
