import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/features/authentication/screens/auth_screen.dart';
import 'package:glide/features/authentication/screens/otp_screen.dart';
import 'package:glide/features/layout/screen/layout_screen.dart';
import 'package:glide/features/onboarding/screen/onboarding_screen.dart';
import 'package:glide/features/profile/screens/wallert_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.authenticationScreen,
  redirect: (context, state) async {
    final isOnboarding =
        AppPreferences().getBool(PrefKeys.isOnboarding) != null;
    final isLogin = AppPreferences().getBool(PrefKeys.isLogin) != null;

    if (!isOnboarding && !isLogin) return AppRoutes.onboardingScreen;
    if (isOnboarding && !isLogin) return AppRoutes.authenticationScreen;
    if (isOnboarding && isLogin) return AppRoutes.layoutScreen;
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
      path: AppRoutes.walletScreen,
      builder: (context, state) {
        return const WallertScreen();
      },
    ),
  ],
);
