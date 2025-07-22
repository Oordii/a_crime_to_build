import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/features/auth/presentation/widgets/submit_button.dart';
import 'package:crime_game/features/home/data/profile.dart';
import 'package:crime_game/features/home/domain/models/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileCreateDialog extends ConsumerStatefulWidget {
  const ProfileCreateDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ProfileCreateDialogState();
}

class ProfileCreateDialogState extends ConsumerState<ProfileCreateDialog> {
  final usernameC = TextEditingController();
  String? error;
  bool loading = false;
  bool isSubmited = false;

  @override
  void dispose() {
    usernameC.dispose();
    super.dispose();
  }

  _profileListener(
    AsyncValue<ProfileModel>? prev,
    AsyncValue<ProfileModel> next,
  ) {
    next.when(
      data: (profile) {
        if (isSubmited) {
          context.pop();
        }
      },
      error: (error, st) {
        setState(() {
          this.error = error.toString();
          isSubmited = false;
        });
      },
      loading: () {
        setState(() {
          loading = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileProvider, _profileListener);

    return Material(
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
              Text('Enter your username', style: context.textTheme.titleMedium),
              const SizedBox(height: 24),
              TextField(controller: usernameC),
              const SizedBox(height: 48),
              SubmitButton(
                isLoading: loading,
                error: error,
                onTap: () {
                  setState(() {
                    isSubmited = true;
                  });
                  ref
                      .read(profileProvider.notifier)
                      .setUsername(usernameC.text.trim());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
