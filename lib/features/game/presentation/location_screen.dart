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

    return game.when(
      data: (GameModel data) {
        final location = data.locations.singleWhere(
          (e) => e.id == widget.locationId,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(location.name, style: context.textTheme.displayLarge),
          ),
          body: Center(
            child: Text(
              location.desc ?? "smth i dunno",
              style: context.textTheme.bodyMedium,
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString(), style: context.textTheme.labelSmall),
          ),
        );
      },
      loading: () {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
