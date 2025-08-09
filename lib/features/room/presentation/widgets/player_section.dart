import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/domain/app_user/app_user.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/room/data/leave_room/leave_room.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:crime_game/features/room/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerSection extends StatelessWidget {
  const PlayerSection({super.key, required this.roomData, required this.auth});

  final Room roomData;
  final AppUser auth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(Icons.info_outlined, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Text('Players', style: context.textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(4),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Icon(Icons.star, size: 16),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          roomData.creator.username,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                for (final user in roomData.users) ...[
                  UserCard(user: user, auth: auth, roomData: roomData),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 48),
        Consumer(
          builder: (context, ref, child) {
            final leave = ref.watch(leaveRoomProvider);
            return SubmitButton(
              isLoading: leave.isLoading,
              error: leave.error?.toString(),
              onTap: () async {
                final confirm = await showDialog(
                  context: context,
                  builder: (context) => LeaveRoomConfirmDialog(),
                );

                if (confirm ?? false) {
                  ref.read(leaveRoomProvider.notifier).leave();
                }
              },
              text: 'Leave room',
            );
          },
        ),
      ],
    );
  }
}
