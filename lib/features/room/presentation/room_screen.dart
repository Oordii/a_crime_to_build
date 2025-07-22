import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomScreen extends ConsumerStatefulWidget {
  final String roomCode;
  const RoomScreen({super.key, required this.roomCode});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RoomScreenState();
}

class RoomScreenState extends ConsumerState<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
