import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.controller,
    required this.child,
    this.onPressed,
    this.height,
    this.bgColor,
    this.animateOnTap = true,
    this.resetAfterDuration = true,
  });
  final RoundedLoadingButtonController controller;
  final Widget child;
  final VoidCallback? onPressed;
  final double? height;
  final Color? bgColor;
  final bool animateOnTap;
  final bool resetAfterDuration;

  @override
  Widget build(BuildContext context) {
    // final theme = Get.find<ThemeController>();
    return RoundedLoadingButton(
      resetAfterDuration: resetAfterDuration,
      animateOnTap: animateOnTap,
      controller: controller,
      onPressed: onPressed,
      width: ScreenUtil().screenWidth,
      borderRadius: 15,
      height: height ?? 50.h,
      elevation: 0,
      color: bgColor ?? AppColors.primary(context),
      successColor: Colors.white,
      child: child,
    );
  }
}
