import 'dart:developer';

import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/widgets/custom_phone_form_field.dart';
import 'package:glide/core/widgets/loading_button.dart';
import 'package:glide/features/authentication/cubit/auth_cubit.dart';
import 'package:glide/features/authentication/cubit/auth_states.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your mobile number',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 18.h),
                  Form(
                    key: formKey,
                    child: Hero(
                      tag: 'phone',
                      child: CustomPhoneFormField(
                        controller: context.read<AuthCubit>().phoneFormField,
                        countryCode: context.read<AuthCubit>().countryCode,
                        selectedCountry:
                            context.read<AuthCubit>().slectedCountry,
                        onChangedCountry: (value) {
                          context.read<AuthCubit>().countryCode =
                              value.phoneCode;
                          context.read<AuthCubit>().slectedCountry =
                              value.countryCode;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),
                  LoadingButton(
                    controller: RoundedLoadingButtonController(),
                    height: 56.h,
                    animateOnTap: false,
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    onPressed: () async {
                      final isValid = CountryUtils.validatePhoneNumber(
                          context
                              .read<AuthCubit>()
                              .phoneFormField
                              .text
                              .toString(),
                          '+${context.read<AuthCubit>().countryCode}');

                      if (context
                          .read<AuthCubit>()
                          .phoneFormField
                          .text
                          .isEmpty) {
                        showSnackBar(
                          context: context,
                          color: Colors.red,
                          title: 'On Snap!',
                          message: 'Please enter your phone number',
                        );
                      } else if (!isValid) {
                        showSnackBar(
                          context: context,
                          color: Colors.red,
                          title: 'On Snap!',
                          message: 'Please enter a valid phone number',
                        );
                      } else {
                        await AppPreferences().setBool(PrefKeys.isLogin, true);
                        if (context.mounted) {
                          await AppPreferences().setString(
                              PrefKeys.userNumber,
                              context
                                  .read<AuthCubit>()
                                  .phoneFormField
                                  .text
                                  .toString());
                        }
                        if (context.mounted) {
                          await AppPreferences().setString(
                              PrefKeys.userCountryCode,
                              context.read<AuthCubit>().countryCode.toString());
                        }
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          context.push(AppRoutes.otpScreen, extra: {
                            'phone':
                                context.read<AuthCubit>().phoneFormField.text,
                            'countryCode':
                                context.read<AuthCubit>().countryCode,
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    """By proceeding, you consent to get calls, or SMS messages, including by automated means, from Glide and its affiliates to the number provided.""",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('or',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  BlocListener<AuthCubit, AuthStates>(
                    listener: (context, state) {
                      log(state.toString());
                      if (state is AuthWithGoogleSuccess) {
                        showSnackBar(
                          context: context,
                          color: Colors.teal,
                          title: 'Congratulations!',
                          message: 'You are logged in successfully',
                        );
                        Future.delayed(const Duration(seconds: 1), () {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            context.go(AppRoutes.homeScreen);
                          }
                        });
                      } else if (state is AuthWithGoogleError) {
                        showSnackBar(
                          context: context,
                          color: Colors.red,
                          title: 'On Snap!',
                          message: state.error,
                        );
                      }
                    },
                    child: SizedBox(
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().signInWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            side: const BorderSide(color: AppColors.greyColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.svg.google,
                            ),
                            const Spacer(),
                            Text(
                              'Continue with google',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
