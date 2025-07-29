import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:crime_game/features/auth/domain/domain.dart';
import 'package:crime_game/features/auth/presentation/email_sent_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_in_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_up_screen.dart';
import 'package:crime_game/features/home/presentation/home_screen.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/presentation/room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod()
GoRouter router(Ref ref) {
  final auth = ref.watch(authProvider);
  final room = ref.watch(roomDataProvider);

  return GoRouter(
    initialLocation: Routes.signIn.path,
    refreshListenable: RouterNotifier(ref),
    redirect: (context, state) {
      final isAuthenticated = !auth.isEmpty;

      if (state.fullPath == Routes.signIn.path) {
        return isAuthenticated ? Routes.home.path : Routes.signIn.path;
      } else if (state.fullPath == Routes.signUp.path) {
        return isAuthenticated ? Routes.home.path : Routes.signUp.path;
      } else if (state.fullPath == Routes.emailSent.path) {
        return isAuthenticated ? Routes.home.path : Routes.emailSent.path;
      }

      if (!isAuthenticated) {
        return Routes.signIn.path;
      }

      if (room.hasValue) {
        return Routes.room.path;
      }

      if (state.fullPath == Routes.room.path && room.hasError) {
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: Routes.signUp.path,
        name: Routes.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.emailSent.path,
        name: Routes.emailSent.name,
        builder: (context, state) => const EmailSentScreen(),
      ),
      GoRoute(
        path: Routes.room.path,
        name: Routes.room.name,
        builder: (context, state) {
          return RoomScreen();
        },
      ),
    ],
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AppUser>(authProvider, (_, __) => notifyListeners());
    _ref.listen(roomDataProvider, (prev, cur) => notifyListeners());
  }
}
