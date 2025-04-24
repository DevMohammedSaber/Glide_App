import 'package:flutter/material.dart';
import 'package:glide/core/utils/constants/prefs_keys.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/features/authentication/presentation/screens/auth_screen.dart';
import 'package:glide/features/authentication/presentation/screens/otp_screen.dart';
import 'package:glide/features/authentication/presentation/screens/register_screen.dart';
import 'package:glide/features/layout/screen/layout_screen.dart';
import 'package:glide/features/login/presentation/screens/login_screen.dart';
import 'package:glide/features/maps/presentation/screen/map_screen.dart';
import 'package:glide/features/onboarding/screen/onboarding_screen.dart';
import 'package:glide/features/profile/screens/wallert_screen.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.layoutScreen,
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    const publicRoutes = {
      AppRoutes.onboardingScreen,
      AppRoutes.loginScreen,
      AppRoutes.registrationScreen,
      AppRoutes.authenticationScreen,
      AppRoutes.otpScreen,
    };

    final isOnboarding =
        AppPreferences().getBool(PrefKeys.isOnboarding) ?? false;
    final isLogin = AppPreferences().getBool(PrefKeys.isLogin) ?? false;

    // Allow public routes without redirect
    if (publicRoutes.contains(state.matchedLocation)) {
      return null;
    }

    // Redirect logic
    if (!isOnboarding) {
      return AppRoutes.onboardingScreen;
    } else if (!isLogin) {
      return AppRoutes.loginScreen;
    }
    debugPrint("Navigating to: ${state.matchedLocation}");
    return null; // allow navigation
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
      path: AppRoutes.registrationScreen,
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.loginScreen,
      builder: (context, state) {
        return const LoginScreen();
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
    GoRoute(
      path: AppRoutes.mapScreen,
      builder: (context, state) {
        return const MapScreen();
      },
    ),
  ],
);
