import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmDialog extends StatelessWidget {
  final String? title;
  final String body;
  final String confirmText;
  final int confirmFlex;
  const ConfirmDialog({
    super.key,
    this.title,
    required this.body,
    required this.confirmText,
    this.confirmFlex = 2,
  });

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
                Text(
                  title ?? 'Are you sure?',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Text(body, textAlign: TextAlign.center)),
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
                      flex: confirmFlex,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop(true);
                        },
                        child: Text(confirmText),
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
