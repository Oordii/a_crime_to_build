import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/domain/models/room/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomCard extends StatefulWidget {
  const RoomCard({super.key, required this.room});

  final Room room;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.room_sharp, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${widget.room.creator.username}`s room #${widget.room.code}',
                style: context.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 8),
            Consumer(
              builder: (context, ref, child) {
                final joinState = ref.watch(joinRoomProvider);
                final roomData = ref.watch(roomDataProvider);

                final roomError =
                    roomData.error?.toString() == 'no_room_entered'
                    ? null
                    : roomData.error?.toString();

                return SubmitButton(
                  error: joinState.error?.toString() ?? roomError,
                  isLoading:
                      isSubmitted &&
                      (joinState.isLoading || roomData.isLoading),
                  onTap: () {
                    ref
                        .read(joinRoomProvider.notifier)
                        .joinActiveRoom(room: widget.room);
                  },

                  text: 'Join',
                  width: 90,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
