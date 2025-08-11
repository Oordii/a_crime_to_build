import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/game/data/game/game.dart';
import 'package:crime_game/features/game/domain/models/location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LocationCard extends ConsumerWidget {
  const LocationCard({
    super.key,
    required this.location,
    required this.isSelected,
  });

  final Location location;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: isSelected
            ? null
            : () {
                ref.read(gameProvider.notifier).goto(location.id);
                context.pop();
              },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).highlightColor
                : Theme.of(context).cardColor,
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
