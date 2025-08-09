import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/domain/app_user/app_user.dart';
import 'package:crime_game/features/room/data/kick_user/kick_user.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.user,
    required this.auth,
    required this.roomData,
  });

  final RoomUser user;
  final AppUser auth;
  final Room roomData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(4),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Icon(Icons.person, size: 16),
            ),
            const SizedBox(width: 4),
            Text(user.username, style: context.textTheme.bodyMedium),
            const Spacer(),
            if (auth.uid == roomData.creator.id)
              IconButton(
                onPressed: () {
                  ref.read(kickUserProvider(userId: user.id));
                },
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.exit_to_app, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
