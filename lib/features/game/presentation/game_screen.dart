import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/game/data/game/game.dart';
import 'package:crime_game/features/game/domain/enums/event_type.dart';
import 'package:crime_game/features/game/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerStatefulWidget {
  final Widget child;
  const GameScreen({super.key, required this.child});

  @override
  ConsumerState<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends ConsumerState<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final game = ref.watch(gameProvider);

    if (!game.hasValue) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final gameData = game.value!;

    final selectedLoc = gameData.events
        .where((e) => e.eventType == EventType.move)
        .lastOrNull
        ?.eventData['location_id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(gameData.name, style: context.textTheme.displayLarge),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text('Were should we go?', style: context.textTheme.titleMedium),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  for (final loc in gameData.locations) ...[
                    LocationCard(
                      location: loc,
                      isSelected: loc.id == selectedLoc,
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(child: widget.child),
      ),
    );
  }
}
