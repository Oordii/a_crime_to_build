import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth/auth.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/game/data/game/game.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:crime_game/features/room/data/start_game/start_game.dart';
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
  bool gameStartLoading = false;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 48),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: PlayerSection(roomData: roomData, auth: auth),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 3,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final game = ref.watch(gameProvider);
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
                                  ...game.map<List<Widget>>(
                                    data: (data) {
                                      final gameData = data.value;

                                      return [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              gameData.name,
                                              style: context
                                                  .textTheme
                                                  .displayLarge,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                gameData.fullDesc,
                                                style: context
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (auth.uid ==
                                            roomData.creator.id) ...[
                                          const SizedBox(height: 24),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              SubmitButton(
                                                text: 'Start game',
                                                isLoading: gameStartLoading,
                                                onTap: () async {
                                                  setState(() {
                                                    gameStartLoading = true;
                                                  });

                                                  final future = ref.read(
                                                    startGameProvider.future,
                                                  );

                                                  await future;

                                                  setState(() {
                                                    gameStartLoading = false;
                                                  });
                                                },
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ],
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
                                      Center(
                                        child: CircularProgressIndicator(),
                                      ),
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
      ),
    );
  }
}
