import 'package:crime_game/core/resources/theme.dart';
import 'package:crime_game/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Crime',
      theme: darkDetectiveTheme,
      routerConfig: router,
    );
  }
}
