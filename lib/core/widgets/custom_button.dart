import 'package:flutter/material.dart';
import 'package:glide/core/utils/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.bgColor,
    this.textColor,
    this.textStyle,
    this.width, this.child,
  });

  final String title;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primary(context),
          foregroundColor: textColor ?? AppColors.text(context),
          // fixedSize: Size.infinite,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: onPressed,
        child:child?? Text(
          title,
          style: textStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
