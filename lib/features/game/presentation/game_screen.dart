import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/game/data/game/game.dart';
import 'package:crime_game/features/game/domain/models/location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Case #1242 ${gameData.name}',
          style: context.textTheme.displayLarge,
        ),
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
                    LocationCard(location: loc),
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

class LocationCard extends ConsumerWidget {
  const LocationCard({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {
          ref.read(gameProvider.notifier).goto(location.id);
          context.pop();
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.location_on_rounded, size: 14),
                  ),
                  const SizedBox(width: 4),
                  Text(location.name, style: context.textTheme.bodyMedium),
                ],
              ),
              if (location.desc != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        location.desc!,
                        style: context.textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
