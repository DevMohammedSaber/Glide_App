import 'package:flutter/material.dart';
import 'package:glide/core/utils/constants/prefs_keys.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  Assets.png.onboarding.path,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Get started with your account \nand enjoy the experience! 🎉',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                    title: 'Get Started',
                    width: double.infinity,
                    textColor: Colors.white,
                    onPressed: () {
                      AppPreferences().setBool(PrefKeys.isOnboarding, true);
                      if (context.mounted) {
                        context.go(AppRoutes.loginScreen);
                      }
                    }),
              ),
              // Hero(
              //   tag: 'phone',
              //   child: CustomPhoneFormField(
              //     readOnly: true,
              //     enablePicker: false,
              //     countryCode: '1',
              //     selectedCountry: "CA",
              //     padding: const EdgeInsets.all(16),
              //     onTap: () async {
              //       await AppPreferences().setBool(PrefKeys.isOnboarding, true);
              //       if (context.mounted) {
              //         context.go(AppRoutes.authenticationScreen);
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
