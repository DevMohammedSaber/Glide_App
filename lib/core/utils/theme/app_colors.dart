import 'package:flutter/material.dart';

class AppColors {
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color lightPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;
  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static Color background(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;
  static Color surface(BuildContext context) =>
      Theme.of(context).colorScheme.surface;
  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.error;
  static Color text(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.color!;

  static Color grey(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFAFAFAF)
          : Colors.grey[400]!;

  static Color lightGrey(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF0F1F3)
          : Colors.grey[800]!;

  static Color darkGrey(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFE6E6E6)
          : Colors.grey[800]!;
}
