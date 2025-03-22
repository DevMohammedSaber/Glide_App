import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/features/authentication/screens/auth_screen.dart';
import 'package:glide/features/authentication/screens/otp_screen.dart';
import 'package:glide/features/home/screen/home_screen.dart';
import 'package:glide/features/layout/screen/layout_screen.dart';
import 'package:glide/features/onboarding/screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.layoutScreen,
  redirect: (context, state) {
    return null;
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
      path: AppRoutes.homeScreen,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
