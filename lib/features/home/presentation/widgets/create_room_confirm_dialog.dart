import 'package:crime_game/core/resources/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateRoomConfirmDialog extends StatelessWidget {
  const CreateRoomConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      body:
          'You have active room. If you start new game you will leave previously created/joined rooms',
      confirmText: 'Start anyway',
    );
  }
}
