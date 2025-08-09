import 'package:crime_game/core/resources/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JoinRoomConfirmDialog extends StatelessWidget {
  const JoinRoomConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      body:
          'You have active room. If you join new game you will leave previously created/joined rooms',
      confirmText: 'Join anyway',
    );
  }
}
