import 'package:crime_game/core/app/app.dart';
import 'package:crime_game/core/app/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();

  runApp(ProviderScope(child: const App()));
}
