import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get size => MediaQuery.of(this).size;

  double get height => size.height;

  double get width => size.width;

  GoRouter get router => GoRouter.of(this);
}
