import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/widgets/custom_phone_form_field.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth,
              height: 617.h,
              child: Image.asset(Assets.png.onboarding.path),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Get started with your account \nand enjoy the experience! 🎉',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Hero(
              tag: 'phone',
              child: CustomPhoneFormField(
                readOnly: true,
                enablePicker: false,
                countryCode: '1',
                selectedCountry: "CA",
                padding: const EdgeInsets.all(16),
                onTap: () async {
                  await AppPreferences().setBool(PrefKeys.isOnboarding, true);
                  if (context.mounted) {
                    context.go(AppRoutes.authenticationScreen);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
