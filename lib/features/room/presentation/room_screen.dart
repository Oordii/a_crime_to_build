import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth/auth.dart';
import 'package:crime_game/features/home/data/data.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/data/kick_user/kick_user.dart';
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
  void roomListener(AsyncValue<Room>? prev, AsyncValue<Room> cur) {
    if (cur.error?.toString() == 'no_room_entered') {
      context.router.goNamed(Routes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final room = ref.watch(roomDataProvider);
    ref.listen(roomDataProvider, roomListener);

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

    final auth = ref.watch(authProvider);

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
                                    const Spacer(),
                                    if (auth.uid == roomData.creator.id)
                                      IconButton(
                                        onPressed: () {
                                          ref.read(
                                            kickUserProvider(userId: user.id),
                                          );
                                        },
                                        icon: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4,
                                          ),
                                          child: Icon(
                                            Icons.exit_to_app,
                                            size: 16,
                                          ),
                                        ),
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
                  child: Consumer(
                    builder: (context, ref, child) {
                      final scenarios = ref.watch(scenariosProvider);
                      return Card(
                        child: SizedBox(
                          height: 700,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 24,
                            ),
                            child: Column(
                              children: [
                                RoomCode(roomData: roomData),
                                const SizedBox(height: 24),
                                ...scenarios.map<List<Widget>>(
                                  data: (data) {
                                    final scenario = data.value.singleWhere(
                                      (e) => e.id == roomData.scenarioId,
                                    );

                                    return [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            scenario.name,
                                            style:
                                                context.textTheme.displayLarge,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              scenario.fullDesc,
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ];
                                  },
                                  error: (err) => [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.info_outlined,
                                          size: 36,
                                          color: Colors.red.shade700,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Error occured: ${err.error.toString()}',
                                          style: context.textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                  loading: (_) => [
                                    Center(child: CircularProgressIndicator()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
