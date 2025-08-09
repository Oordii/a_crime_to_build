import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateRoomConfirmDialog extends ConsumerStatefulWidget {
  const CreateRoomConfirmDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CreateRoomConfirmDialogState();
}

class CreateRoomConfirmDialogState
    extends ConsumerState<CreateRoomConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Card(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Are you sure?', style: context.textTheme.titleMedium),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have active room. If you start new game you will leave previously created/joined rooms',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop(false);
                        },
                        child: Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop(true);
                        },
                        child: Text('Start anyway'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
