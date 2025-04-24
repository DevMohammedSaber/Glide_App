import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/di.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/utils/validation/validators.dart';
import 'package:glide/core/widgets/custom_password_form_field.dart';
import 'package:glide/core/widgets/custom_text_form_field.dart';
import 'package:glide/core/widgets/loading_button.dart';
import 'package:glide/features/authentication/presentation/cubit/register_cubit.dart';
import 'package:glide/features/authentication/presentation/cubit/register_states.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/phone_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        di(),
      ),
      child: BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return Scaffold(
              body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22.h),
                    Text(
                      'Welcome! Let’s Get Started',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Join Glide Today!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    CustomTextFormField(
                      controller: cubit.nameFormField,
                      labelText: 'User Name',
                      validator: Validators.validateName,
                      icon: Icons.person,
                    ),
                    SizedBox(height: 22.h),
                    CustomTextFormField(
                      controller: cubit.emailFormField,
                      labelText: 'E-mail',
                      validator: Validators.validateName,
                      icon: Icons.email,
                    ),
                    SizedBox(height: 22.h),
                    CustomPhoneFormField(
                      controller: cubit.phoneNumber,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    // CustomTextFormField(
                    //   controller: cubit.phoneFormField,
                    //   labelText: 'Phone Number',
                    //   validator: Validators.validateName,
                    //   icon: Icons.phone,
                    // ),
                    SizedBox(height: 22.h),
                    CustomPasswordFormField(
                      controller: cubit.passwordFormField,
                      hintText: 'Password',
                      validator: (value) {
                        //
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else if (!RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$')
                            .hasMatch(value)) {
                          return 'Password must include lowercase and uppercase letter';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 22.h),
                    CustomPasswordFormField(
                      controller: cubit.confirmPasswordFormField,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your confirm password';
                        } else if (value != cubit.passwordFormField.text) {
                          return 'Password Not Match';
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    BlocListener<RegisterCubit, RegisterStates>(
                      listener: (context, state) {
                        if (state is RegisterStateError) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          showSnackBar(
                            context: context,
                            color: Colors.red,
                            title: 'On Snap!',
                            message: state.error,
                          );
                        }
                      },
                      child: LoadingButton(
                          controller: cubit.btnController,
                          height: 56.h,
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onPressed: () async {
                            cubit.register();
                          }),
                    ),
                    // SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            context.pushReplacement(AppRoutes.loginScreen);
                          },
                          child: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.primary(context),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      """By proceeding, you consent to get calls, or SMS messages, including by automated means, from Glide and its affiliates to the number provided.""",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.grey(context),
                          ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
