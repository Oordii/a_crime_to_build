import 'dart:async';

import 'package:crime_game/core/resources/utils/supabase.dart';
import 'package:crime_game/features/auth/domain/app_user/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  AppUser build() {
    initListener();

    return supabase.auth.currentSession == null
        ? AppUser.empty
        : AppUser.fromSession(supabase.auth.currentSession!);
  }

  initListener() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      state = AppUser.fromSession(data.session);
    });
  }

  Future<String?> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);

      return null;
    } on AuthException catch (er) {
      print(er.message);
      return er.message;
    } catch (err) {
      return err.toString();
    }
  }

  logout() async {
    await supabase.auth.signOut();
  }

  dispose() {
    _authStateSubscription.cancel();
  }
}
