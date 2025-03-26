import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/di.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/widgets/loading_button.dart';
import 'package:glide/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:glide/features/authentication/presentation/cubit/auth_states.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.phone,
    required this.countryCode,
  });
  final String phone;
  final String countryCode;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        sendOtp: di(),
        verifyOtp: di(),
        signInWithGoogle: di(),
      ),
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Enter the 4-digit code sent to you \nat +${widget.countryCode}${widget.phone}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Pinput(
                      controller: controller,
                      animationDuration: const Duration(milliseconds: 300),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      onCompleted: (value) {},
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Send code again after  ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.grey(context),
                          ),
                      children: [
                        TextSpan(
                          text: '(0:31s)',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: BlocListener<AuthCubit, AuthStates>(
                      listener: (context, state) {
                        if (state is AuthWithPhoneNumberVerifyOtpSuccess) {
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
                              context.push(AppRoutes.layoutScreen);
                            }
                          });
                        } else if (state is AuthWithPhoneNumberVerifyOtpError) {
                          showSnackBar(
                            context: context,
                            color: Colors.red,
                            title: 'On Snap!',
                            message: state.error,
                          );
                        }
                      },
                      child: LoadingButton(
                        controller: RoundedLoadingButtonController(),
                        height: 56.h,
                        animateOnTap: false,
                        child: Text('Verify',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.text(context),
                                  fontWeight: FontWeight.w600,
                                )),
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            showSnackBar(
                              context: context,
                              color: Colors.red,
                              title: 'On Snap!',
                              message: 'Please enter OTP',
                            );
                          } else if (controller.text.length < 4) {
                            showSnackBar(
                              context: context,
                              color: Colors.red,
                              title: 'On Snap!',
                              message: 'Please enter valid OTP',
                            );
                          } else {
                            context
                                .read<AuthCubit>()
                                .signInWithPhoneNumberVerifyOtp(
                                    '1', controller.text);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
