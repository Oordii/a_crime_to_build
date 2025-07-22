import 'package:crime_game/core/resources/extensions/build_context.dart';
import 'package:crime_game/core/router/router_constants.dart';
import 'package:crime_game/features/auth/data/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailSentScreen extends ConsumerWidget {
  const EmailSentScreen({super.key});

  String body(String? email) {
    final toInsert = email == null ? '.' : ' $email.';
    return 'Email successfully sent to your address$toInsert Follow link inside to continue.';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);

    final email = signUpState.maybeMap(
      data: (v) => v.value,
      orElse: () => null,
    );

    if (signUpState is! AsyncData || email == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.replaceNamed(Routes.signIn.name);
      });

      return const SizedBox();
    }

    return Scaffold(
      body: SafeArea(
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
                Text('Email Sent', style: context.textTheme.titleMedium),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Text(body(email), textAlign: TextAlign.center),
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
