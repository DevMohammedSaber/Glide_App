import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/features/authentication/presentation/screens/auth_screen.dart';
import 'package:glide/features/authentication/presentation/screens/otp_screen.dart';
import 'package:glide/features/layout/screen/layout_screen.dart';
import 'package:glide/features/onboarding/screen/onboarding_screen.dart';
import 'package:glide/features/profile/screens/wallert_screen.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.layoutScreen,
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    log(state.matchedLocation);
    if (state.matchedLocation == AppRoutes.otpScreen) {
      return state.matchedLocation;
    }
    final isOnboarding =
        AppPreferences().getBool(PrefKeys.isOnboarding) ?? false;
    final isLogin = AppPreferences().getBool(PrefKeys.isLogin) ?? false;
    if (!isOnboarding) {
      return AppRoutes.onboardingScreen;
    } else if (!isLogin) {
      return AppRoutes.authenticationScreen;
    } else {
      return null;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.onboardingScreen,
      builder: (context, state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.authenticationScreen,
      builder: (context, state) {
        return const AuthenticationScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.otpScreen,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return OtpScreen(
          countryCode: data['countryCode'],
          phone: data['phone'],
        );
      },
    ),
    GoRoute(
      path: AppRoutes.layoutScreen,
      builder: (context, state) {
        return const LayoutScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.walletScreen,
      builder: (context, state) {
        return const WallertScreen();
      },
    ),
  ],
);
