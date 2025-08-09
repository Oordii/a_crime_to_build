import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/home/domain/domain.dart';
import 'package:crime_game/features/home/presentation/widgets/widgets.dart';
import 'package:crime_game/features/room/data/active_rooms/active_rooms.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampaignCard extends StatefulWidget {
  final ScenarioModel scenario;
  const CampaignCard({super.key, required this.scenario});

  @override
  State<CampaignCard> createState() => _CampaignCardState();
}

class _CampaignCardState extends State<CampaignCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 800,
      margin: EdgeInsets.symmetric(vertical: 12),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.white12, blurRadius: 10, spreadRadius: 8),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.scenario.coverUrl,
                height: 450,
                width: 800,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            widget.scenario.name,
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            widget.scenario.shortDesc,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 16,
            child: Consumer(
              builder: (context, ref, child) {
                final createRoomState = ref.watch(createRoomProvider);
                final roomState = ref.watch(roomDataProvider);
                final activeRooms = ref.watch(activeRoomsProvider);
                ref.listen(roomDataProvider, _roomListener);

                final roomError =
                    roomState.error?.toString() == 'no_room_entered'
                    ? null
                    : roomState.error?.toString();

                return SubmitButton(
                  text: 'Start',
                  isLoading: createRoomState.isLoading || activeRooms.isLoading,
                  error: createRoomState.error?.toString() ?? roomError,
                  onTap: () async {
                    bool shouldCreate = true;
                    if (activeRooms.hasValue && activeRooms.value!.isNotEmpty) {
                      shouldCreate = false;
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => CreateRoomConfirmDialog(),
                      );

                      if (confirm ?? false) {
                        shouldCreate = true;
                      }
                    }

                    if (shouldCreate) {
                      ref
                          .read(createRoomProvider.notifier)
                          .createRoom(scenarioId: widget.scenario.id);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _roomListener(AsyncValue<Room>? prev, AsyncValue<Room> cur) {
    if (cur.hasValue) {
      context.router.pushNamed(Routes.room.name);
    }
  }
}
