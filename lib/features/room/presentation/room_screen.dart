import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:crime_game/features/room/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomScreen extends ConsumerStatefulWidget {
  const RoomScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RoomScreenState();
}

class RoomScreenState extends ConsumerState<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final room = ref.watch(roomDataProvider);

    if (room is AsyncLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (room is AsyncError) {
      return Scaffold(
        body: Center(
          child: Text(
            room.error.toString(),
            style: context.textTheme.labelSmall,
          ),
        ),
      );
    }

    final roomData = (room as AsyncData<Room>).value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Waiting room', style: context.textTheme.displayLarge),
        actions: [],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 48),
                Expanded(
                  child: Card(
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
                              Text(
                                'Players',
                                style: context.textTheme.bodyLarge,
                              ),
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
                            Card(
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(4),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Icon(Icons.person, size: 16),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      user.username,
                                      style: context.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: Card(
                    child: SizedBox(
                      height: 700,
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          RoomCode(roomData: roomData),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
