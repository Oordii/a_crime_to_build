import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/home/presentation/widgets/join_room_confirm_dialog.dart';
import 'package:crime_game/features/room/data/active_rooms/active_rooms.dart';
import 'package:crime_game/features/room/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinDialog extends ConsumerStatefulWidget {
  const JoinDialog({super.key});

  @override
  ConsumerState<JoinDialog> createState() => _JoinDialogState();
}

class _JoinDialogState extends ConsumerState<JoinDialog> {
  final codeC = TextEditingController();

  @override
  void dispose() {
    codeC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final join = ref.watch(joinRoomProvider);
    final activeRooms = ref.watch(activeRoomsProvider);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 450,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Join room', style: context.textTheme.titleMedium),
              const SizedBox(height: 24),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: codeC,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
                    UpperCaseTextFormatter(),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter room code',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.paste),
                      onPressed: () async {
                        final data = await Clipboard.getData(
                          Clipboard.kTextPlain,
                        );
                        final pasted =
                            data?.text?.replaceAll(
                              RegExp(r'[^A-Za-z0-9]'),
                              '',
                            ) ??
                            '';
                        final upper = pasted.toUpperCase().substring(
                          0,
                          pasted.length.clamp(0, 6),
                        );
                        codeC.text = upper;
                        codeC.selection = TextSelection.collapsed(
                          offset: upper.length,
                        );
                      },
                    ),
                  ),
                  textCapitalization: TextCapitalization.characters,
                ),
              ),
              const SizedBox(height: 48),
              SubmitButton(
                isLoading: join.isLoading || activeRooms.isLoading,
                error: join.error?.toString(),
                onTap: () async {
                  bool shouldJoin = true;
                  if (activeRooms.hasValue && activeRooms.value!.isNotEmpty) {
                    shouldJoin = false;
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => JoinRoomConfirmDialog(),
                    );

                    if (confirm ?? false) {
                      shouldJoin = true;
                    }
                  }

                  if (shouldJoin) {
                    ref
                        .read(joinRoomProvider.notifier)
                        .joinRoom(code: codeC.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
