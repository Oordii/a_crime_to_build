import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:crime_game/features/auth/domain/domain.dart';
import 'package:crime_game/features/auth/presentation/email_sent_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_in_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_up_screen.dart';
import 'package:crime_game/features/home/presentation/home_screen.dart';
import 'package:crime_game/features/room/presentation/room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final auth = ref.watch(authProvider);

  return GoRouter(
    initialLocation: Routes.signIn.path,
    refreshListenable: RouterNotifier(ref),
    redirect: (context, state) {
      final isAuthenticated = !auth.isEmpty;
      debugPrint('isAuth $isAuthenticated path ${state.fullPath}');

      if (state.fullPath == Routes.signIn.path) {
        return isAuthenticated ? Routes.home.path : Routes.signIn.path;
      } else if (state.fullPath == Routes.signUp.path) {
        return isAuthenticated ? Routes.home.path : Routes.signUp.path;
      } else if (state.fullPath == Routes.emailSent.path) {
        return isAuthenticated ? Routes.home.path : Routes.emailSent.path;
      }

      return isAuthenticated ? null : Routes.signIn.path;
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
        redirect: (context, state) {
          if (state.pathParameters.containsKey('room_code')) {
            return null;
          } else {
            return Routes.home.path;
          }
        },
        builder: (context, state) {
          final roomCode = state.pathParameters['room_code']!;
          return RoomScreen(roomCode: roomCode);
        },
      ),
    ],
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AppUser>(authProvider, (_, __) => notifyListeners());
  }
}
