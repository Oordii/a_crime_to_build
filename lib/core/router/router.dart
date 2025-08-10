import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:crime_game/features/auth/domain/domain.dart';
import 'package:crime_game/features/auth/presentation/email_sent_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_in_screen.dart';
import 'package:crime_game/features/auth/presentation/sign_up_screen.dart';
import 'package:crime_game/features/game/presentation/game_screen.dart';
import 'package:crime_game/features/game/presentation/location_screen.dart';
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
        redirect: (context, state) {
          if (room.hasValue && room.error?.toString() != 'no_room_entered') {
            return Routes.room.path;
          }
          return null;
        },
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
          if (room.error?.toString() == 'no_room_entered') {
            return Routes.home.path;
          }

          return null;
        },
        builder: (context, state) {
          return RoomScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return GameScreen(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.location.path,
            name: Routes.location.name,
            redirect: (context, state) {
              final id = state.pathParameters['location_id'];
              if (id == null || id.isEmpty) {
                return Routes.game.path;
              }
              return null;
            },
            builder: (context, state) {
              final locationId = state.pathParameters['location_id']!;
              return LocationScreen(locationId: locationId);
            },
          ),
        ],
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
