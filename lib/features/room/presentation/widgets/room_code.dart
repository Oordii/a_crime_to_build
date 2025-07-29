import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/room/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomCode extends StatelessWidget {
  const RoomCode({super.key, required this.roomData});

  final Room roomData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Icon(Icons.info_outlined, size: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Room code to join: #${roomData.code}',
              style: context.textTheme.bodyMedium,
            ),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: roomData.code));

              if (!context.mounted) {
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Icon(Icons.info_outlined, size: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Copied to clipboard',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                ),
              );
            },
            icon: Icon(Icons.copy, size: 24),
          ),
        ],
      ),
    );
  }
}
