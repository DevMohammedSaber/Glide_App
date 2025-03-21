import 'package:flutter/material.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/widgets/loading_button.dart';
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
                      color: AppColors.greyColor,
                    ),
                children: [
                  TextSpan(
                    text: '(0:31s)',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: LoadingButton(
                controller: RoundedLoadingButtonController(),
                animateOnTap: false,
                child: Text('Verify',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.whiteColor,
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
                    context.go(AppRoutes.homeScreen);
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
