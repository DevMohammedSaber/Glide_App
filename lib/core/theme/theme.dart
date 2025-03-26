import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  static final lightTheme = _buildLightTheme();
  static final darkTheme = _buildDarkTheme();

  void toggleTheme() =>
      emit(state.brightness == Brightness.dark ? lightTheme : darkTheme);

  static ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xff00C9A7),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xff00C9A7),
        secondary: Color(0xff004D40),
        error: Colors.red,
        outline: Colors.grey,
      ),
      textTheme: _customTextTheme(Colors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff00C9A7),
      scaffoldBackgroundColor: Colors.grey[900],
      colorScheme: ColorScheme.dark(
        primary: const Color(0xff00C9A7),
        secondary: const Color(0xff004D40),
        surface: Colors.grey[850]!,
        error: Colors.red[300]!,
      ),
      textTheme: _customTextTheme(Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
    );
  }

  static TextTheme _customTextTheme(Color textColor) {
    return TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: textColor),
      headlineMedium: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.normal, color: textColor),
      headlineSmall: TextStyle(
          fontSize: 23.0, fontWeight: FontWeight.w500, color: textColor),
      bodyLarge: TextStyle(
          fontSize: 17.0, fontWeight: FontWeight.normal, color: textColor),
      bodyMedium: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
      bodySmall: TextStyle(
          fontSize: 13.0, fontWeight: FontWeight.normal, color: textColor),
      titleLarge: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor),
      titleSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: textColor),
      labelLarge: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: textColor),
      labelMedium: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: textColor),
      labelSmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: textColor),
    );
  }
}

class AppColors {
  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
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
