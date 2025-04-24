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
import 'package:glide/features/login/presentation/cubit/login_cubit.dart';
import 'package:glide/features/login/presentation/cubit/login_states.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        di(),
      ),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
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
                      'Welcome Back to Glide',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Let’s Pick Up Where You Left Off',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    CustomTextFormField(
                      controller: cubit.emailFormField,
                      labelText: 'E-mail',
                      validator: Validators.validateName,
                      icon: Icons.email,
                    ),
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
                        }
                        return null;
                      },
                    ),
                    const Spacer(flex: 3),
                    BlocListener<LoginCubit, LoginStates>(
                      listener: (context, state) {
                        if (state is LoginStateError) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          showSnackBar(
                            context: context,
                            color: Colors.red,
                            title: 'On Snap!',
                            message: state.error,
                          );
                        } else if (state is LoginStateSuccess) {
                          showSnackBar(
                            context: context,
                            color: Colors.green,
                            title: 'Congrats!',
                            message: "Login Successfully",
                          );
                          Future.delayed(const Duration(seconds: 1), () {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              context.push(AppRoutes.layoutScreen);
                            }
                          });
                        }
                      },
                      child: LoadingButton(
                          controller: cubit.btnController,
                          height: 56.h,
                          // animateOnTap: false,
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onPressed: () {
                            cubit.login();
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don’t have an account? '),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {
                            context
                                .pushReplacement(AppRoutes.registrationScreen);
                          },
                          child: Text(
                            'Register',
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
