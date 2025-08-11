import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/game/data/game/game.dart';
import 'package:crime_game/features/game/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationScreen extends ConsumerStatefulWidget {
  final String locationId;
  const LocationScreen({super.key, required this.locationId});

  @override
  ConsumerState<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends ConsumerState<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    final game = ref.watch(gameProvider);

    if (game is AsyncError<GameModel>) {
      return Scaffold(
        body: Center(
          child: Text(
            game.error.toString(),
            style: context.textTheme.labelSmall,
          ),
        ),
      );
    }

    if (game is AsyncLoading<GameModel>) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final location = game.value!.locations.singleWhere(
      (e) => e.id == widget.locationId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name, style: context.textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          children: [
            Expanded(flex: 1, child: Column()),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  if (location.backgroundUrl != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.network(
                        location.backgroundUrl!,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  if (location.desc != null)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            location.desc!,
                            style: context.textTheme.titleMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'What should we do here?',
                          style: context.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
