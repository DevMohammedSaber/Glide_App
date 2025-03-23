import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff00C9A7);
  static const Color secondaryColor = Color(0xff004D40);
  static const Color greyColor = Color(0xFFAFAFAF);
  static const Color darkGreyColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;
  static const Color blueColor = Colors.blue;
  static const Color orangeColor = Colors.orange;
  static const Color lightGreyColor = Color(0xFFE8E8E8);
  static const Color textColor = Color(0xff000000);
  static const Color lightBlueColor = Color(0xffCAE0FE);
}

TextTheme customTextTheme = const TextTheme(
  // Headline styles
  headlineLarge: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  headlineMedium: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  ),
  headlineSmall: TextStyle(
    fontSize: 23.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  ),
  bodyLarge: TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  ),
  bodyMedium: TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  ),
  bodySmall: TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  ),
  titleLarge: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  titleMedium: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  titleSmall: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  labelLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  labelMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  ),
  labelSmall: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  ),
);

ThemeData customTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.whiteColor,
  ),
  scaffoldBackgroundColor: AppColors.whiteColor,
  primaryColor: AppColors.primaryColor,
  textTheme: customTextTheme, // Apply the custom text styles here
);
