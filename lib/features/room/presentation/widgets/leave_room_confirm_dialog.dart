import 'package:crime_game/core/resources/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LeaveRoomConfirmDialog extends StatelessWidget {
  const LeaveRoomConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      body: 'Are you sure you want leave room?',
      confirmText: 'Leave',
      confirmFlex: 1,
    );
  }
}
